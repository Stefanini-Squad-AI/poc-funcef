unit UModulo;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
  ToolWin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
  Wwdatsrc, DBCtrls;

type
   TModulo = Class(TObject)
   
   Function ExecutaQuery         (Qry:TQuery; Const Str:String) :Boolean;
   Function FazQuery             (Var Qry:TwwQuery; Str:String) :Boolean;
   Function TrocaVirgulaPonto    (Value: String): String;

   private

   public

end;

var
   Modulo : TModulo;

implementation

Function TModulo.ExecutaQuery(Qry: TQuery; Const Str :String): Boolean;
begin
  Result := False;
  With Qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(Str);
      ExecSQL;
    Except
      // Mostra Erro
      On E: Exception Do Begin
        If MessageDlg('Erro na Execução da Query, '+Qry.Name+' :'+#13+
                    #13+Str+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13+#13+'Deseja Capturar a Query ?',MtError,[MbYes,MbNo],0) = MrYes Then Begin
          InputBox('Mensagem do Sistema ', 'Query Errada !!', Qry.Sql.GetText);
        End;
        Result := False;
        Exit;
      End;
    End;
  End;
  Result := True;
end;

Function TModulo.FazQuery(Var Qry : TwwQuery; Str : String) : Boolean;
Var
  wLinha  :String;
  wInicial, wFinal  :Integer;
Begin
  wInicial:= -1;
  wFinal  := -1;
  With Qry Do
  Begin
     Try
        Close;
        SQL.Clear;
        SQL.Add(Str);
        Open;
     Except
        // Mostra Erro
        On E:Exception Do
        Begin
           // Monta Linha da Query
           wInicial:=1;
           wFinal  :=(Pos('FROM',Str)-1);
           If wFinal <= 0 Then
              wFinal:= Length(Str);
           wLinha:=Copy(Str,1,wFinal)+#13;
           // From Ate Where
           wInicial:=(Pos('FROM',Str)-1);
           wFinal  :=(((Pos('WHERE',Str)-1))-Length(wLinha));
           If wFinal <= 0 Then
              wInicial:=Length(wLinha);wFinal:=Length(Str);

           wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
           // Where Ate Order by
           wInicial:=(Pos('WHERE',Str)-1);
           wFinal  :=(((Pos('ORDER BY',Str)-1))-Length(wLinha));
           If wFinal <= 0 Then
              wInicial:=Length(wLinha);wFinal:=Length(Str);

           wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
           // Order By Ate Group By
           wInicial:=(Pos('ORDER BY',Str)-1);
           wFinal  :=(((Pos('GROUP BY',Str)-1))-Length(wLinha));
           If wFinal <= 0 Then
             wInicial:=Length(wLinha);wFinal:=Length(Str);
           wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
           // Group By Ate Final
           wInicial:=(Pos('GROUP BY',Str)-1);
           wFinal  :=Length(Str);
           If wInicial <= 0 Then
             wInicial:=Length(wLinha);wFinal:=Length(Str);

           wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
           If MessageDlg('Erro na Abertura da Query, '+Qry.Name+' :'+#13+
                       #13+wLinha+
                       #13+'Com a Mensagem, '+#13+
                       #13+E.Message+#13+#13+'Deseja Capturar a Query ?',MtError,[MbYes,MbNo],0) = MrYes Then
              InputBox('Mensagem do Sistema ', 'Query Errada !!', Qry.Sql.GetText);

           Result := False;
        End;
     End;
     Result := (EOF <> BOF);
  End;
End;

Function TModulo.TrocaVirgulaPonto(Value: String): String;
var
  iPosVirg : Integer;
begin
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+'.'+copy(Value,iPosVirg+1,length(Value));
  Result:=Value;
end;

end.
