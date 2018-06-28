global class scheduledRemoveJob implements Schedulable {
    global void execute(SchedulableContext sc) {
        BatchOldBookDetailsDelete b = new BatchOldBookDetailsDelete(); 
        database.executebatch(b);
    }
}