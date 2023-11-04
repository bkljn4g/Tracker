//
//  TrackerRecordStore.swift
//  Tracker
//
//  Created by Ann Goncharova on 22.10.2023.
//

import UIKit
import CoreData

<<<<<<< HEAD
class TrackerRecordStore {
    
    private let context: NSManagedObjectContext
    
    convenience init() {
        let context = DatabaseManager.shared.context
        self.init(context: context)
=======
enum TrackerRecordStoreError: Error {
    case decodingErrorInvalidName
}

struct TrackerRecordStoreUpdate {
    struct Move: Hashable {
        let oldIndex: Int
        let newIndex: Int
    }
    let insertedIndexes: IndexSet
    let deletedIndexes: IndexSet
    let updatedIndexes: IndexSet
    let movedIndexes: Set<Move>
}

protocol TrackerRecordStoreDelegate: AnyObject {
    func store(
        _ store: TrackerRecordStore,
        didUpdate update: TrackerRecordStoreUpdate
    )
}

class TrackerRecordStore: NSObject {
    weak var delegate: TrackerRecordStoreDelegate?
    private let context: NSManagedObjectContext
    private var fetchedResultsController: NSFetchedResultsController<TrackerRecordCoreData>!
    private var insertedIndexes: IndexSet?
    private var deletedIndexes: IndexSet?
    private var updatedIndexes: IndexSet?
    private var movedIndexes: Set<TrackerRecordStoreUpdate.Move>?
    
    convenience override init() {
        let context = DatabaseManager.shared.context
        self.init(context: context)
        do {
            try fetchedResultsController.performFetch()
        } catch {
            assertionFailure("TrackerRecordStore fetch failed")
        }
    }
    
    var trackerRecords: [TrackerRecord] {
        guard let objects = self.fetchedResultsController.fetchedObjects, let trackerRecords = try? objects.map({ try self.trackerRecord(from: $0)})
        else { return [] }
        return trackerRecords
>>>>>>> sprint_17
    }
    
    init(context: NSManagedObjectContext) {
        self.context = context
<<<<<<< HEAD
    }
    
    func addNewTrackerRecord(_ trackerRecord: TrackerRecord) throws {
=======
        super.init()
        
        let fetchRequest = TrackerRecordCoreData.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(keyPath: \TrackerRecordCoreData.date, ascending: true)
        ]
        let controller = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        controller.delegate = self
        self.fetchedResultsController = controller
    }
    
    func addNewTrackerRecord(
        _ trackerRecord: TrackerRecord)
    throws {
>>>>>>> sprint_17
        let trackerRecordCoreData = TrackerRecordCoreData(context: context)
        updateExistingTrackerRecord(trackerRecordCoreData, with: trackerRecord)
        try context.save()
    }
    
<<<<<<< HEAD
    func deleteTrackerRecord(with id: UUID) throws {
        let fetchRequest = TrackerRecordCoreData.fetchRequest()
        let trackerRecordFromCoreData = try context.fetch(fetchRequest)
        let record = trackerRecordFromCoreData.first {
            $0.idTracker == id
        }
        if let record = record {
            context.delete(record)
            try context.save()
        }
    }
    
    func updateExistingTrackerRecord(_ trackerRecordCoreData: TrackerRecordCoreData, with record: TrackerRecord) {
        trackerRecordCoreData.idTracker = record.idTracker
        trackerRecordCoreData.date = record.date
    }
    
    func fetchTrackerRecord() throws -> [TrackerRecord] {
        let fetchRequest = TrackerRecordCoreData.fetchRequest()
        let trackerRecordFromCoreData = try context.fetch(fetchRequest)
        return try trackerRecordFromCoreData.map { try self.trackerRecord(from: $0) }
    }
    
=======
    func deleteTrackerRecord(with id: UUID, date: Date) throws {
        let trackerRecord = fetchedResultsController.fetchedObjects?.first {
            $0.idTracker == id &&
            $0.date?.yearMonthDayComponents == date.yearMonthDayComponents
        }
        if let trackerRecord = trackerRecord {
            context.delete(trackerRecord)
            try context.save()
        }
        refresh()
    }
    
    func deleteRecords(forTrackerWithID trackerID: UUID) throws {
        let fetchRequest = NSFetchRequest<TrackerRecordCoreData>(entityName: "TrackerRecordCoreData")
        fetchRequest.predicate = NSPredicate(format: "idTracker == %@", trackerID as CVarArg)
        do {
            let recordsToDelete = try context.fetch(fetchRequest)
            for record in recordsToDelete {
                context.delete(record)
            }
            try context.save()
        } catch {
            throw error
        }
    }
    
    
    func refresh() {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            // обработка ошибки, если не удается обновить данные
            print("Не удалось обновить данные в хранилище: \(error)")
        }
    }
    
    func updateExistingTrackerRecord(
        _ trackerRecordCoreData: TrackerRecordCoreData,
        with record: TrackerRecord) {
            trackerRecordCoreData.idTracker = record.idTracker
            trackerRecordCoreData.date = record.date
        }
    
>>>>>>> sprint_17
    func trackerRecord(from data: TrackerRecordCoreData) throws -> TrackerRecord {
        guard let id = data.idTracker else {
            throw DatabaseError.someError
        }
        guard let date = data.date else {
            throw DatabaseError.someError
        }
        return TrackerRecord(
            idTracker: id,
            date: date
        )
    }
}
<<<<<<< HEAD
=======

extension TrackerRecordStore: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            insertedIndexes = IndexSet()
            deletedIndexes = IndexSet()
            updatedIndexes = IndexSet()
            movedIndexes = Set<TrackerRecordStoreUpdate.Move>()
        }
    
    func controllerDidChangeContent(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            delegate?.store(
                self,
                didUpdate: TrackerRecordStoreUpdate(
                    insertedIndexes: insertedIndexes ?? [],
                    deletedIndexes: deletedIndexes ?? [],
                    updatedIndexes: updatedIndexes ?? [],
                    movedIndexes: movedIndexes ?? []
                )
            )
            insertedIndexes = nil
            deletedIndexes = nil
            updatedIndexes = nil
            movedIndexes = nil
        }
    
    func controller(
        _ controller: NSFetchedResultsController<NSFetchRequestResult>,
        didChange anObject: Any,
        at indexPath: IndexPath?,
        for type: NSFetchedResultsChangeType,
        newIndexPath: IndexPath?
    ) {
        switch type {
            case .insert:
                guard let indexPath = newIndexPath else {
                    assertionFailure("insert indexPath - nil")
                    return
                }
                insertedIndexes?.insert(indexPath.item)
            case .delete:
                guard let indexPath = indexPath else {
                    assertionFailure("delete indexPath - nil")
                    return
                }
                deletedIndexes?.insert(indexPath.item)
            case .update:
                guard let indexPath = indexPath else {
                    assertionFailure("update indexPath - nil")
                    return
                }
                updatedIndexes?.insert(indexPath.item)
            case .move:
                guard let oldIndexPath = indexPath, let newIndexPath = newIndexPath else {
                    assertionFailure("move indexPath - nil")
                    return
                }
                movedIndexes?.insert(.init(oldIndex: oldIndexPath.item, newIndex: newIndexPath.item))
            @unknown default:
                assertionFailure("unknown case")
        }
    }
}
>>>>>>> sprint_17
