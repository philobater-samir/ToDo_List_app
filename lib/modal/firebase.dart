import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_course/modal/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore: (task, options) => task.toJson(),
      );
}

Future<void> addTaskToFireStore(Task task) {
  var taskCollection = getTaskCollection();
  var docRef = taskCollection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}
