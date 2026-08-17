Unit uCtrlAltDadosBancDoc;

//andre tavares - pendência 20588 - 04/11/2005 - atualizar o histórico do documento também na contabilidade.
//===========================================================
//  Pendência : 17979
//  Autor     : Rodolpho da Silva
//  Data      : 14/02/2005
//  Descrição : Implementar alteração nos históricos de lançamentos
//
//===========================================================

Interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
  DbClient, uCMTypes, uCMClientDataSet, uCtrlPadroes, uListaCamposHistCapCar,
  uCtrlModeloHistorico, uFuncaoGeral, uCtrlHistoContab;

Type
  TCtrlAltDadosBancDoc = Class(TCmControlObject)
  protected
    Procedure AfterInitialize; override;
  private
    CtrlPadroes: TCtrlPadroes;
    _Cds: TCMClientDataSet;
  public
    Constructor Create; override;
    Destructor Destroy; override;
    Function GravaAltDadosBancDoc(ovData, ovDataHistLanc: OleVariant; iEmpresa,iModulo,iUsuario : Integer): Boolean;
  End;

Implementation

{ TCtrlAltDadosBancDoc }

Procedure TCtrlAltDadosBancDoc.AfterInitialize;
Begin
  Inherited;
  CtrlPadroes.InitializeAs(self);
  CtrlPadroes.OpenTransaction := false;
End;

Constructor TCtrlAltDadosBancDoc.Create;
Begin
  Inherited;
  _Cds := TCMClientDataSet.Create(Nil);
  CtrlPadroes := TCtrlPadroes.Create;
End;

Destructor TCtrlAltDadosBancDoc.Destroy;
Begin
  _Cds.Free;
  CtrlPadroes.Free;
  Inherited;
End;




Function TCtrlAltDadosBancDoc.GravaAltDadosBancDoc(ovData, ovDataHistLanc: OleVariant; iEmpresa,iModulo,iUsuario : Integer): Boolean;
Var sSQL: String;
Begin

  If ConnectionSide = cnsClient Then
  Begin
    //  Início - Rodolpho da Silva - P: 17979
    Result := Connection.AppServer.GravaAltDadosBancDoc(ovData, ovDataHistLanc, iEmpresa,iModulo,iUsuario);
    //  Fim   - Rodolpho da Silva - P: 17979



    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      _Cds.Data := ovData;


      Result := True;
      sSQL := 'UPDATE DOCUMENTO SET ' +
        'NUMLEITCODBARRAS = ' + QuotedStr(_Cds.FieldByName('NUMLEITCODBARRAS').AsString) +
        ', NUMDIGCODBARRAS = ' + QuotedStr(_Cds.FieldByName('NUMDIGCODBARRAS').AsString) +

        //Bruno Bastos - Pend. 17541 - 13/09/2004 - Início
        ', REFERENCIA = ' + QuotedStr(_Cds.FieldByName('REFERENCIA').AsString) +
        ', OBS = ' + QuotedStr(_Cds.FieldByName('OBS').AsString);
        //Bruno Bastos - Pend. 17541 - 13/09/2004 - Fim

      If _Cds.FieldByName('CODFORMA').AsString <> '' Then
        sSQL := sSQL + ', CODFORMA = ' + _Cds.FieldByName('CODFORMA').AsString;
      If _Cds.FieldByName('CODPORTFORMA').AsString <> '' Then
        sSQL := sSQL + ', CODPORTFORMA = ' + _Cds.FieldByName('CODPORTFORMA').AsString;
      If _Cds.FieldByName('IDCBANCARIA').AsString <> '' Then
        sSQL := sSQL + ', IDCBANCARIA = ' + _Cds.FieldByName('IDCBANCARIA').AsString;
      sSQL := sSQL + 'WHERE ' +
        'CODDOCUMENTO = ' + _Cds.FieldByName('CODDOCUMENTO').AsString;



      If Not ExecSQL(sSQL) Then
        Raise Exception.Create(MessageInfo)


      else
      begin
         _Cds.Data := ovDataHistLanc;

         while not _Cds.Eof do
         begin
            sSQL :=  'UPDATE '               +
                     '   LANCTODOCUM '       +
                     'SET '                  +
                     '   HISTORICOCOMPL = '  + QuotedStr(_Cds.FieldByName('HISTORICOCOMPL').AsString)  +
                     'WHERE '                +
                     '   (NUMLANCTO      = ' + _Cds.FieldByName('NUMLANCTO').AsString + ') AND ' +
                     '   (CODDOCUMENTO   = ' + _Cds.FieldByName('CODDOCUMENTO').AsString + ') ';

            if not ExecSQL(sSQL) then
               Raise Exception.Create(MessageInfo);

            _Cds.Next;
         end;
      end;   

      //  Início - Rodolpho da Silva - P: 17979 - 22/12/2005
      If Not CtrlPadroes.GravaLogOperacoes(iEmpresa,iModulo,iUsuario,'Alteracao Dados Bancarios - Cod. Documento: ' +  _Cds.FieldByName('CODDOCUMENTO').AsString,False) Then
        Raise Exception.Create(CtrlPadroes.MessageInfo);
      Commit;
    Except
      On E: Exception Do
      Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
End;

End.

