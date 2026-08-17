unit uCtrlGeral;

interface

Uses DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};  

Type
  TCtrlGeral = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
  private

  public
      {Esta função tem como objetivo retornar o número como string com '.' ao inves de ','}
      function OraNumero(rNumero : Double ):string;
      {Calcula o grau de determinado conteudo}
      Function CalcGrau(sMascara,sConteudo : String): Integer;
      {Calcula o número de graus máximo de acordo com a mascara}
      Function CalcGrauMax(sMascara : String): Integer;
      {Calcula o número de elementos do grau informado}
      Function CalcNumEleGrau(sMascara :String;iGrau:Integer): Integer;
      {Verifica se o que foi digitado é compatível com a mascara do campo}
      Function VerificaGrau(sMascara,sConteudo : String): Boolean;
      {Verifica se existe o pai do conteudo informado}
      Function VerificaPai(sNomeTabela,sNomeCampo,sMascara,sConteudo,sComplemento : String): Boolean;
      {Calcula a mascara do grau informado}
      Function CalcMascaraPorGrau(sMascara : String; iGrau : integer): string;

  end;

implementation


Uses uCMMath;

procedure TCtrlGeral.DoChangeDataBase;
begin
  inherited;
end;


function TCtrlGeral.CalcGrau(sMascara, sConteudo: String): Integer;
var iNumEleSP,iNumDigC,iNumDigM,i: Integer;
begin
   Result   := 1;
   sConteudo:=trim(sConteudo);
   sMascara :=trim(sMascara);
   iNumDigM :=Length(sMascara);
   iNumDigC :=Length(sConteudo);
   iNumEleSP:=0;
   for i:= 1 to iNumDigM do begin
      if iNumEleSP>=iNumDigC then
         Break;
      if Copy(sMascara,i,1)='.' then
         Result:=Result+1
      else
         iNumEleSP:=iNumEleSP+1;
   end;
end;

function TCtrlGeral.CalcGrauMax(sMascara: String): Integer;
var iNumDigM,i: Integer;
begin
   Result   := 1;
   sMascara :=trim(sMascara);
   iNumDigM :=Length(sMascara);
   for i:= 1 to iNumDigM do begin
      if Copy(sMascara,i,1)='.' then
         Result:=Result+1;
   end;
end;

function TCtrlGeral.CalcMascaraPorGrau(sMascara: String;
  iGrau: integer): string;
var iNumElem: integer;
begin
   //Retorna a mascara até o grau solicitado
   //Ex.: Suponhamos a conta 11101 (grau 4) e a Mascara: 9.9.9.99.999
   //     CalcMascaraPorGrau('9.9.9.99.999',4) = '9.9.9.99'
   iNumElem := CalcNumEleGrau(sMascara,iGrau);
   result := copy(sMascara, 1, (iNumElem + iGrau - 1 ));
end;

function TCtrlGeral.CalcNumEleGrau(sMascara: String;
  iGrau: Integer): Integer;
var iNumDigM,iNumPontos,i: Integer;
begin
   Result    := 0;
   iNumPontos:=1;
   sMascara  :=trim(sMascara);
   iNumDigM  :=Length(sMascara);
   for i:= 1 to iNumDigM do begin
      if iNumPontos>iGrau then
         Break;
      if Copy(sMascara,i,1)='.' then
         iNumPontos:=iNumPontos+1
      else
         Result:=Result+1;
   end;
end;

function TCtrlGeral.OraNumero(rNumero: Double): string;
begin
   Result := FloatToStrCM(rNumero);
end;

function TCtrlGeral.VerificaGrau(sMascara, sConteudo: String): Boolean;
var iGrau,iNumEleC,iNumEle,iNumDigM,i: Integer;
begin
    Result   :=True;
    sMascara :=trim(sMascara);
    sConteudo:=trim(sConteudo);
    iGrau    :=CalcGrau(sMascara,sConteudo);
    iNumEleC :=CalcNumEleGrau(sMascara,iGrau);
    iNumEle  :=0;
    iNumDigM :=Length(trim(sConteudo));
    for i:= 1 to iNumDigM do begin
       if Copy(sConteudo,i,1) <> '.' then
          iNumEle:=iNumEle+1;
    end;
    if iNumEle <> iNumEleC then
       Result:=False;
end;

function TCtrlGeral.VerificaPai(sNomeTabela, sNomeCampo, sMascara,
  sConteudo, sComplemento: String): Boolean;
var
  iGrau,iNumEleC: Integer;
  sSqlAux, sConteudoP: String;
begin
   {Funcão implementada na Aplicação Servidora}
      if sComplemento <> '' then
         sSqlAux := ' AND ' + sComplemento
      Else
         sSqlAux := '';

      _Cds.Data := GetDataPacket( 'SELECT ' + sNomeCampo + ' FROM ' + sNomeTabela +
                                  ' WHERE ' + sNomeCampo + ' = ' + QuotedStr( sConteudo ) + sSqlAux );

      if _Cds.IsEmpty then begin
         Result      := False;
         MessageInfo := 'Registro ' + sConteudo + ' não encontrado';
      end else begin
         Result    := True;
         sMascara  := trim( sMascara );
         sConteudo := trim( sConteudo );
         iGrau     := CalcGrau( sMascara, sConteudo );
         dec(iGrau);

         if iGrau <> 0 then begin
            iNumEleC   := CalcNumEleGrau( sMascara, iGrau );
            sConteudoP := Copy( sConteudo, 1, iNumEleC );

            _Cds.Data := GetDataPacket( 'SELECT ' + sNomeCampo + ' FROM ' + sNomeTabela +
                                        ' WHERE ' + sNomeCampo + ' = ' + QuotedStr( sConteudoP ) + sSqlAux );

            if _Cds.IsEmpty then begin
               Result := False;
               MessageInfo := 'Não Existe Pai para o Registro ' + sConteudoP;
            end;
         end;
      end;
end;

end.

