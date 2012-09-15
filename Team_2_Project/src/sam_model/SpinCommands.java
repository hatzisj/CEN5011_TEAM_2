
package sam_model;

import java.util.Properties;

public class SpinCommands {

	//all commands on the verify panel
	public static final String SAFETY = "safety";
	public static final String INVALID_ENDSTATES = "invalidEndstates";
	public static final String ASSERTION_VIOLATIONS = "assertionViolations";
	public static final String ASSERTIONS = "assertions";
	public static final String EXHAUSTIVE = "exhaustive";
	public static final String HASH_COMPACT = "hashCompact";
	public static final String BIT_STATE = "bitState";
	public static final String MINIMIZED_AUTOMATA = "minimizedAutomata";
	public static final String COLLAPSE_COMPRESSION = "collapseCompression";
	public static final String DEPTH_FIRST = "depthFirst";
	public static final String BREADTH_FIRST = "breadthFirst";
	public static final String DEPTH_PARTIAL_ORDER = "depthPartialOrder";
	public static final String BOUNDED = "bounded";
	public static final String BOUNDED_VALUE = "boundedValue";
	public static final String ITERATIVE = "iterative";
	public static final String BREADH_PARTIAL_ORDER = "breadthPartialOrder";
	public static final String REPORT_UNREACHABLE = "reportUnreachable";
	public static final String NON_PROGRESS = "nonProgess";
	public static final String ACCEPTANCE = "acceptance";
	public static final String ENFORCE_WEAK = "enforceWeak";
	public static final String DO_NOT_USE_CLAIM = "doNotUseClaim";
	public static final String USE_CLAIM = "useClaim";
	public static final String CLAIM = "claim";
	public static final String GCC = "gcc";
	public static final String GCC_3 = "gcc-3";
	public static final String GCC_4 = "gcc-4";
	
	public static final String RANDOM_WITH_SEED = "randomWithSeed";
	public static final String SEED_VALUE = "seedValue";
	public static final String INTERACTIVE = "interactive";
	public static final String GUIDED_WITH_TRAIL = "guidedWithTrail";
	public static final String TRAIL_FILE = "trailFile";
	public static final String BLOCKS_NEW_MESSAGE = "blocksNewMessage";
	public static final String LOSES_NEW_MESSAGE = "losesNewMessage";
	
	public static Properties gccOptions;
	public static Properties panOptions;
	
	static
	{
		gccOptions = new Properties();
		gccOptions.put(SAFETY," -DSAFETY");
		gccOptions.put(NON_PROGRESS," -DNP");
		gccOptions.put(HASH_COMPACT," -DHC4");
		gccOptions.put(BIT_STATE," -DBITSTATE");
		gccOptions.put(COLLAPSE_COMPRESSION," -DCOLLAPSE");
		gccOptions.put(BREADTH_FIRST," -DBFS");
		gccOptions.put(BOUNDED," -DBCS");
		gccOptions.put(DO_NOT_USE_CLAIM," -DNOCLAIM");
		gccOptions.put(DEPTH_PARTIAL_ORDER," -DNOREDUCE");
		gccOptions.put(BREADH_PARTIAL_ORDER," -DNOREDUCE");
		gccOptions.put(ITERATIVE," -DREACH");
		
		panOptions = new Properties();
		panOptions.put(INVALID_ENDSTATES," -A");
		panOptions.put(ASSERTION_VIOLATIONS," -E");
		panOptions.put(ASSERTIONS," -E -A");
		panOptions.put(BIT_STATE," -k3 -w20");
		panOptions.put(BREADTH_FIRST," -n");
		panOptions.put(BOUNDED," -L");
		panOptions.put(ITERATIVE," -i");
		panOptions.put(NON_PROGRESS," -E -A -I");
		panOptions.put(ACCEPTANCE," -E -A -a");
		panOptions.put(ENFORCE_WEAK," -f");
		panOptions.put(USE_CLAIM," -N");
		panOptions.put(ITERATIVE," -i");
		panOptions.put(REPORT_UNREACHABLE," -n");
		
	}

}
