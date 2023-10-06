

public aspect TraceAspectGaughen {
	pointcut classToTrace(): execution(public String ComponentApp.getName()) 
    || execution(public String DataApp.getName()) 
    || execution(public String ServiceApp.getName());

	before(): classToTrace() {
		// Getting the signature of the method being executed
		String signature = thisJoinPointStaticPart.getSignature().toShortString(); // toShortString for concise output
		// Getting the line number where the method is defined
		int line = thisJoinPointStaticPart.getSourceLocation().getLine();
		System.out.println("[BGN] " + signature + ", " + line);
	}

	// After advice
	after(): classToTrace() {
		// Getting the file name of the source code being executed
		String filename = thisJoinPointStaticPart.getSourceLocation().getFileName();
		System.out.println("[END] " + filename);
	}
}