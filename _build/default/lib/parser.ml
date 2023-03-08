
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TRUE
    | TIMES
    | THEN
    | RPAREN
    | PLUS
    | LPAREN
    | LET
    | LEQ
    | INT of (
# 5 "lib/parser.mly"
       (int)
# 23 "lib/parser.ml"
  )
    | IN
    | IF
    | ID of (
# 6 "lib/parser.mly"
       (string)
# 30 "lib/parser.ml"
  )
    | FALSE
    | EQUALS
    | EOF
    | ELSE
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
open Ast

# 45 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_prog) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: prog. *)

  | MenhirState02 : (('s, _menhir_box_prog) _menhir_cell1_LPAREN, _menhir_box_prog) _menhir_state
    (** State 02.
        Stack shape : LPAREN.
        Start symbol: prog. *)

  | MenhirState05 : (('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_state
    (** State 05.
        Stack shape : LET ID.
        Start symbol: prog. *)

  | MenhirState07 : (('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_state
    (** State 07.
        Stack shape : IF.
        Start symbol: prog. *)

  | MenhirState11 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 11.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState13 : ((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 13.
        Stack shape : IF expr.
        Start symbol: prog. *)

  | MenhirState15 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 15.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState17 : (('s, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 17.
        Stack shape : expr.
        Start symbol: prog. *)

  | MenhirState19 : (((('s, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 19.
        Stack shape : IF expr expr.
        Start symbol: prog. *)

  | MenhirState22 : ((('s, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_state
    (** State 22.
        Stack shape : LET ID expr.
        Start symbol: prog. *)


and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (Ast.expr)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 6 "lib/parser.mly"
       (string)
# 106 "lib/parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and _menhir_box_prog = 
  | MenhirBox_prog of (Ast.expr) [@@unboxed]

let _menhir_action_01 =
  fun i ->
    (
# 37 "lib/parser.mly"
           ( Int i )
# 126 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_02 =
  fun x ->
    (
# 38 "lib/parser.mly"
          ( Var x )
# 134 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_03 =
  fun () ->
    (
# 39 "lib/parser.mly"
        ( Bool true )
# 142 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_04 =
  fun () ->
    (
# 40 "lib/parser.mly"
         ( Bool false )
# 150 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_05 =
  fun e1 e2 ->
    (
# 41 "lib/parser.mly"
                             ( Binop (Leq, e1, e2) )
# 158 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_06 =
  fun e1 e2 ->
    (
# 42 "lib/parser.mly"
                               ( Binop (Mult, e1, e2) )
# 166 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_07 =
  fun e1 e2 ->
    (
# 43 "lib/parser.mly"
                              ( Binop (Add, e1, e2) )
# 174 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_08 =
  fun e1 e2 x ->
    (
# 44 "lib/parser.mly"
                                                 ( Let (x, e1, e2) )
# 182 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_09 =
  fun e1 e2 e3 ->
    (
# 45 "lib/parser.mly"
                                                   ( If (e1, e2, e3) )
# 190 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_10 =
  fun e ->
    (
# 46 "lib/parser.mly"
                          (e)
# 198 "lib/parser.ml"
     : (Ast.expr))

let _menhir_action_11 =
  fun e ->
    (
# 33 "lib/parser.mly"
                 ( e )
# 206 "lib/parser.ml"
     : (Ast.expr))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQUALS ->
        "EQUALS"
    | FALSE ->
        "FALSE"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | INT _ ->
        "INT"
    | LEQ ->
        "LEQ"
    | LET ->
        "LET"
    | LPAREN ->
        "LPAREN"
    | PLUS ->
        "PLUS"
    | RPAREN ->
        "RPAREN"
    | THEN ->
        "THEN"
    | TIMES ->
        "TIMES"
    | TRUE ->
        "TRUE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_27 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EOF ->
          let e = _v in
          let _v = _menhir_action_11 e in
          MenhirBox_prog _v
      | _ ->
          _eRR ()
  
  and _menhir_run_11 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | LET ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
      let e2 = _v in
      let _v = _menhir_action_06 e1 e2 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState02 ->
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState17 ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState15 ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState13 ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState11 ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState07 ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_24 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_10 e in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | LET ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState15 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_16 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOF | IN | LEQ | PLUS | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_07 e1 e2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | LET ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState02
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState02 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUALS ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_03 () in
                  _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState05 _tok
              | LPAREN ->
                  _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
              | LET ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
              | INT _v_1 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let i = _v_1 in
                  let _v = _menhir_action_01 i in
                  _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState05 _tok
              | IF ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState05
              | ID _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let x = _v_3 in
                  let _v = _menhir_action_02 x in
                  _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState05 _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_04 () in
                  _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState05 _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | IN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | LET ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | INT _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_1 in
              let _v = _menhir_action_01 i in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
          | IF ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState22
          | ID _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_02 x in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState22 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_prog) _menhir_cell1_expr -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LET ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState17 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOF | IN | LEQ | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _menhir_s, e1) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_05 e1 e2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_prog) _menhir_state -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | LET ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState07 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_prog) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | THEN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
          | LET ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
          | INT _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_1 in
              let _v = _menhir_action_01 i in
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
          | IF ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
          | ID _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_02 x in
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState13 _tok
          | _ ->
              _eRR ())
      | PLUS ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_14 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_03 () in
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
          | LPAREN ->
              _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
          | LET ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
          | INT _v_1 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let i = _v_1 in
              let _v = _menhir_action_01 i in
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
          | IF ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
          | ID _v_3 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let x = _v_3 in
              let _v = _menhir_action_02 x in
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_04 () in
              _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState19 _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ((((ttv_stack, _menhir_box_prog) _menhir_cell1_IF, _menhir_box_prog) _menhir_cell1_expr, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOF | IN | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_09 e1 e2 e3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_23 : type  ttv_stack. (((ttv_stack, _menhir_box_prog) _menhir_cell1_LET _menhir_cell0_ID, _menhir_box_prog) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_prog) _menhir_state -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PLUS ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEQ ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ELSE | EOF | IN | RPAREN | THEN ->
          let MenhirCell1_expr (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_08 e1 e2 x in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  let rec _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_prog =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_03 () in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | LPAREN ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LET ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | INT _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let i = _v in
          let _v = _menhir_action_01 i in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | IF ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_04 () in
          _menhir_run_27 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
      | _ ->
          _eRR ()
  
end

let prog =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_prog v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
