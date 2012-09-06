package formulaParser;

import pipe.dataLayer.BasicType;
import pipe.dataLayer.DataType;
import pipe.dataLayer.Token;
import pipe.dataLayer.Transition;
import pipe.dataLayer.abToken;
import formulaParser.formulaAbsyntree.*;
import formulaParser.ErrorMsg;

/**
 * Printout of Abstract Syntax tree
 * @author Zhuo Sun, 2010
 */

public class Printer implements Visitor{

	  int col = 0;          // How many columns should we indent each new line?

	  void indent(int c) {
	    for (int i = 0; i < c; i++)
	      System.out.print("  ");
	  }

	
	@Override
	public void visit(AndFormula elem) {
		if (elem.f1 instanceof AtFormula) {
			System.out.println("AtFormula(");
		} else if (elem.f1 instanceof CpFormula) {
			System.out.println("CpFormula(");
		} else if (elem.f1 instanceof CpxFormula) {
			System.out.println("CpxFormula(");
		}
		
		indent(++col);
		elem.f1.accept(this);
		indent(--col);
		System.out.println(")");
		
		indent(col);
		if (elem.f2 instanceof AtFormula) {
			System.out.println("AtFormula(");
		} else if (elem.f2 instanceof CpFormula) {
			System.out.println("CpFormula(");
		} else if (elem.f2 instanceof CpxFormula) {
			System.out.println("CpxFormula(");
		}
		indent(++col);
		elem.f2.accept(this);
		indent(--col);
		System.out.println(")");
	}

	@Override
	public void visit(BraceTerm elem) {
		System.out.println("BraceTerm(");
		indent(++col);
		elem.t.accept(this);
		indent(--col);
		System.out.println(")");
	}

	@Override
	public void visit(BraceTerms elem) {
		System.out.println("BraceTerms(");
		indent(++col);
		elem.ts.accept(this);
		indent(--col);
		System.out.println(")");
	}

	@Override
	public void visit(ComplexFormula elem) {
		if (elem.f instanceof AtFormula) {
			System.out.println("AtFormula(");
			indent(++col);
		} else if (elem.f instanceof CpFormula) {
			System.out.println("CpFormula(");
			indent(++col);
		} else if (elem.f instanceof CpxFormula) {
			System.out.println("CpxFormula(");
			indent(++col);
		}
		elem.f.accept(this);
		indent(--col);
		System.out.println(")");
	}

	@Override
	public void visit(Diff elem) {
		System.out.println("Diff(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");
	}

	@Override
	public void visit(Div elem) {
		System.out.println("Div(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");

	}

	@Override
	public void visit(EqRel elem) {
		System.out.println("EqRel(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");
	}

	@Override
	public void visit(EquivFormula elem) {
		if (elem.f1 instanceof AtFormula) {
			System.out.println("AtFormula(");
		} else if (elem.f1 instanceof CpFormula) {
			System.out.println("CpFormula(");
		} else if (elem.f1 instanceof CpxFormula) {
			System.out.println("CpxFormula(");
		}
		
		indent(++col);
		elem.f1.accept(this);
		indent(--col);
		System.out.println(")");
		
		indent(col);
		if (elem.f2 instanceof AtFormula) {
			System.out.println("AtFormula(");
		} else if (elem.f2 instanceof CpFormula) {
			System.out.println("CpFormula(");
		} else if (elem.f2 instanceof CpxFormula) {
			System.out.println("CpxFormula(");
		}
		indent(++col);
		elem.f2.accept(this);
		indent(--col);
		System.out.println(")");

	}

	@Override
	public void visit(Exists elem) {
		//nothing
	}

	@Override
	public void visit(False elem) {
		//nothing
	}

	@Override
	public void visit(ForAll elem) {
		//nothing
	}

	@Override
	public void visit(GeqRel elem) {
		System.out.println("GeqRel(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");

		

	}

	@Override
	public void visit(GtRel elem) {
		System.out.println("GtRel(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");


	}

	@Override
	public void visit(Identifier elem) {
		System.out.print("Identifier");
	}

	@Override
	public void visit(IdVariable elem) {
		System.out.println("IdVariable");
	}

	@Override
	public void visit(ImpFormula elem) {
		if (elem.f1 instanceof AtFormula) {
			System.out.println("AtFormula(");
		} else if (elem.f1 instanceof CpFormula) {
			System.out.println("CpFormula(");
		} else if (elem.f1 instanceof CpxFormula) {
			System.out.println("CpxFormula(");
		}
		
		indent(++col);
		elem.f1.accept(this);
		indent(--col);
		System.out.println(")");
		
		indent(col);
		if (elem.f2 instanceof AtFormula) {
			System.out.println("AtFormula(");
		} else if (elem.f2 instanceof CpFormula) {
			System.out.println("CpFormula(");
		} else if (elem.f2 instanceof CpxFormula) {
			System.out.println("CpxFormula(");
		}
		indent(++col);
		elem.f2.accept(this);
		indent(--col);
		System.out.println(")");

	}

	@Override
	public void visit(In elem) {
		//nothing
	}

	@Override
	public void visit(Index elem) {
		System.out.print("Index");

	}

	@Override
	public void visit(IndexVariable elem) {
		System.out.print("IndexVariable(");
		elem.i.accept(this);
		System.out.print(",");
		elem.idx.accept(this);
		System.out.println(")");
	}

	@Override
	public void visit(InRel elem) {
		System.out.println("InRel(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");

		
	}

	@Override
	public void visit(LeqRel elem) {
		System.out.println("LeqRel(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");


	}

	@Override
	public void visit(LtRel elem) {
		System.out.println("LtRel(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");
		

	}

	@Override
	public void visit(Minus elem) {
		System.out.println("Minus(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");
		

	}

	@Override
	public void visit(Mod elem) {
		System.out.println("Mod(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");

	}

	@Override
	public void visit(Mul elem) {
		System.out.println("Mul(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");

	}


	public void visit(NegExp elem) {
		System.out.print("NegExp(");
		elem.t.accept(this);
		System.out.print(")");
		

	}

	@Override
	public void visit(NeqRel elem) {
		System.out.println("NeqRel(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");

		
	}

	@Override
	public void visit(Nexists elem) {
		//nothing
	}

	@Override
	public void visit(Nin elem) {
		//nothing
	}

	@Override
	public void visit(NinRel elem) {
		System.out.println("NinRel(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");

	}

	@Override
	public void visit(NotFormula elem) {
		//System.out.print("NotFormula");
		elem.f.accept(this);
		//System.out.print(")");

	}

	@Override
	public void visit(NumConstant elem) {
		System.out.print("NumConstant(");
		elem.num.accept(this);
		System.out.println(")");

	}

	@Override
	public void visit(Num elem) {
		System.out.print("Num");
	}

	@Override
	public void visit(OrFormula elem) {
		if (elem.f1 instanceof AtFormula) {
			System.out.println("AtFormula(");
		} else if (elem.f1 instanceof CpFormula) {
			System.out.println("CpFormula(");
		} else if (elem.f1 instanceof CpxFormula) {
			System.out.println("CpxFormula(");
		}
		
		indent(++col);
		elem.f1.accept(this);
		indent(--col);
		System.out.println(")");
		
		indent(col);
		if (elem.f2 instanceof AtFormula) {
			System.out.println("AtFormula(");
		} else if (elem.f2 instanceof CpFormula) {
			System.out.println("CpFormula(");
		} else if (elem.f2 instanceof CpxFormula) {
			System.out.println("CpxFormula(");
		}
		indent(++col);
		elem.f2.accept(this);
		indent(--col);
		System.out.println(")");
	}

	@Override
	public void visit(Plus elem) {
		System.out.println("Plus(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");

	}

	@Override
	public void visit(TermRest elem) {
		System.out.println("TermRest(");
		indent(++col);
		elem.t.accept(this);
		indent(--col);
		System.out.println(")");
	}

	@Override
	public void visit(Terms elem) {
		System.out.println("Terms(");
		indent(++col);
		elem.t.accept(this);
		for(int i=0; i<elem.tr.size(); i++){
			indent(col);
			elem.tr.elementAt(i).accept(this);
		}
		indent(--col);
		System.out.println(")");
		
	}

	@Override
	public void visit(True elem) {
		System.out.print("True");
	}

	@Override
//	public void visit(Union elem){
//		elem.t1.accept(this);
//		elem.t2.accept(this);
//
//		if(elem.t1 instanceof VariableTerm){
//			if(((VariableTerm)(elem.t1)).v instanceof IdVariable){
//				((abToken)symTable.lookup(((IdVariable)((VariableTerm)(elem.t1)).v).key)).listToken.add(e);
//			}
//		}else if(elem.t1 instanceof ExpTerm){
//			//to be done
//		}
//	}
	
	public void visit(Union elem) {
		System.out.println("Union(");
		indent(++col);
		elem.t1.accept(this);
		indent(col);  System.out.println(",");
		indent(col);
		elem.t2.accept(this);
		indent(--col);
		System.out.println(")");
	
	}

	@Override
	public void visit(UserVariable elem) {
		System.out.print("UserVariable");
	}

	@Override
	public void visit(ConstantTerm elem) {
		System.out.println("ConstantTerm(");
		indent(++col);
		elem.c.accept(this);
		indent(--col);
		System.out.println(")");
		
	}

	@Override
	public void visit(ExpTerm elem) {
		System.out.println("ExpTerm(");
		indent(++col);
		elem.e.accept(this);
		indent(--col);
		System.out.println(")");
	
	}

	@Override
	public void visit(VariableTerm elem) {
		System.out.println("VariableTerm(");
		indent(++col);
		elem.v.accept(this);
		indent(--col);
		System.out.println(")");
		
	}
	
	@Override
	public void visit(StrConstant elem) {
		System.out.print("StrConstant");
	}
	
	public void visit(AExp elem){
		System.out.println("AExp(");
		indent(++col);
		elem.ae.accept(this);
		indent(--col);
		System.out.println(")");
		
	}
	
	public void visit(RExp elem){
		System.out.println("RExp(");
		indent(++col);
		elem.re.accept(this);
		indent(--col);
		System.out.println(")");
		
		
		
	}
	
	public void visit(SExp elem){
		System.out.println("SExp(");
		indent(++col);
		elem.se.accept(this);
		indent(--col);
		System.out.println(")");
		
		
	}

	@Override
	public void visit(AtomicTerm elem) {
		//System.out.print("AtomicTerm(");
		elem.t.accept(this);
		//System.out.print(")");
		
	}

	@Override
	public void visit(AtFormula elem) {
		if (elem.af instanceof NotFormula) {
			System.out.println("NotFormula(");
		} else if (elem.af instanceof AtomicTerm) {
			System.out.println("AtomicTerm(");
		} 
		indent(++col);
		elem.af.accept(this);
		indent(--col);
		System.out.println(")");
		
	}

	@Override
	public void visit(CpFormula elem) {
		if(elem.cf instanceof AndFormula){
			System.out.println("AndFormula(");
		}else if(elem.cf instanceof OrFormula){
			System.out.println("OrFormula(");
		}else if(elem.cf instanceof ImpFormula){
			System.out.println("ImpFormula(");
		}else if(elem.cf instanceof EquivFormula){
			System.out.println("EquivFormula(");
		}
		indent(++col);
		elem.cf.accept(this);
		indent(--col);
		System.out.println(")");
	
	}

	@Override
	public void visit(CpxFormula elem) {
		System.out.println("ComplexFormula(");
		indent(++col);
		elem.cpf.accept(this);
		indent(--col);
		System.out.println(")");

	}

	@Override
	public void visit(Sentence elem) {
		System.out.println("Program(");
		indent(++col);
		if (elem.f instanceof AtFormula) {
			System.out.println("AtFormula(");
			indent(++col);
		} else if (elem.f instanceof CpFormula) {
			System.out.println("CpFormula(");
			indent(++col);
		} else if (elem.f instanceof CpxFormula) {
			System.out.println("CpxFormula(");
			indent(++col);
		}
		elem.f.accept(this);
		indent(--col);
		System.out.println(")");
		System.out.println(")");

		
	}


	@Override
	public void visit(Empty elem) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void visit(EmptyTerm elem) {
		// TODO Auto-generated method stub
		
	}

}
