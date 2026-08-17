unit uCtrlElemDemonstrativo;

interface

Uses DB, uDataBase, uDbElemDemonstrativo, uCmControlObject, dbclient, sysutils,Provider,
      ComCtrls,CMProcuraMask, CMProcura,DBTables,  uMidasUtil,uCMSqlParams,
     uDbDemonstrativo, uDbCompoElemDem,dBaseDados, uCtrlDemonstrativo,
      {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type

    TCtrlElemDemonstrativo = Class(TCmControlObject)

    private
       CtrlDemonstrativo : TCtrlDemonstrativo;
       FProximaElemOrdemLinha : Double;
       //-------------------------------------------------------------------------
       // Classes de Persistência
       //-------------------------------------------------------------------------
       _dbElemDemo         :TDbElemDemonstrativo;
       _dbCompoElemDem     :TDbCompoElemDem;
       _dbInsDemonstrativo :TDbDemonstrativo;

       //-------------------------------------------------------------------------
       // Componentes de uso interno
       //-------------------------------------------------------------------------

       FcdsMestre      : TClientDataSet;
       FcdsDetalheConta: TClientDataSet;
       FcdsDetalheSoma : TClientDataSet;

       cdsDemoDest    : TClientDataSet;
       cdsElemDemo    : TClientDataSet;
       cdsCompElemDem : TClientDataSet;

       //-------------------------------------------------------------------------
       // Componentes de usados para copiar demonstrativo no cad. de elementos do
       // Demonstrativo
       //-------------------------------------------------------------------------
       procedure SetcdsMestre(const Value: TClientDataSet);
       procedure SetcdsDetalheConta(const Value: TClientDataSet);
       procedure SetcdsDetalheSoma(const Value: TClientDataSet);

    protected
       procedure DoChangeDataBase; Override;
       procedure OnCreateAppServer;override;
       procedure AfterInitialize;override;



    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property ProximaElemOrdemLinha: Double Read FProximaElemOrdemLinha Write FProximaElemOrdemLinha;
      Property cdsMestre        : TClientDataSet read FcdsMestre write SetcdsMestre;
      Property cdsDetalheConta  : TClientDataSet read FcdsDetalheConta write SetcdsDetalheConta;
      Property cdsDetalheSoma   : TClientDataSet read FcdsDetalheSoma write SetcdsDetalheSoma;


      {Esta função tem como objetivo listar o(s) regsitro(s) da tabela ElemDemonstrativo}
      function ListElemDemonstrativo(iIdDemonstrativo,iIdElemDemonstrat,iIdElemAnaVertical,iIdElemAnaVert1: Double) :OleVariant;

      {Esta função te mcomo objetivo preencher o cds principal do cadastro elem. demonstrativo}
      function ListCdsMestre (dIdElemDemonstrat:Double) :OleVariant;

      {Esta função tem com objetivo preencher o detalhe do somatorio do cadastro de elem. demonstrativo}
      function ListCdsDetSomatorio(dIdElemDemonstrat:Double):OleVariant;

      {Esta função tem com objetivo preencher o detalhe da conta do cadastro de elem. demonstrativo}
      function ListCdsDetConta(dIdElemDemonstrat:Double):OleVariant;

      {Esta função tem como objetivo retorna a proxima ordemlinha da tabela elemdemonstrativo}
      function RetornaElemOrdemLinha(dDemo:Double) :Boolean;

      {Esta função tem como objetivo gravar elementos do demonstrativo}
      function Gravar :Boolean;

      {Esta função tem como objetivo apagar elementos do demonstrativo}
      function Apagar :Boolean;

      {Esta função preenche cdsElemDemo usado para copiar o demonstrativo}
      function ListElemDemo(dDemo:Double):OleVariant;

      {Esta função preenche cdsElemDemo usado para copiar o demonstrativo}
      function ListCompElemDem(dIdElemdemo:Double):OleVariant;

      {Esta função tem o objetivo de copiar o demonstrativo}
      function CopiarDemonstrativo(rgEscolha,iDemoOri,iDemoDes,iEmpresaProp:Integer) :Boolean;
    protected
    End;


implementation

procedure TCtrlElemDemonstrativo.OnCreateAppServer;
begin
  inherited;
    FCdsMestre       := TClientDataSet.Create(nil);
    FCdsDetalheConta := TClientDataSet.Create(nil);
    FCdsDetalheSoma  := TClientDataSet.Create(nil);

end;

constructor TCtrlElemDemonstrativo.Create;
begin
  inherited;
  _dbElemDemo          := TDbElemDemonstrativo.Create(Self);
  _dbCompoElemDem      := TDbCompoElemDem.Create(Self);
  _dbInsDemonstrativo  := TDbDemonstrativo.Create(Self);

  CtrlDemonstrativo    := TCtrlDemonstrativo.Create;

  cdsDemoDest    := TClientDataSet.Create(nil);
  cdsElemDemo    := TClientDataSet.Create(nil);
  cdsCompElemDem := TClientDataSet.Create(nil);
end;

destructor TCtrlElemDemonstrativo.Destroy;
begin
  inherited;
  If IsAppServer Then
  Begin
    FcdsMestre.Free;
    FcdsDetalheConta.Free;
    FcdsDetalheSoma.Free;
  End;

  _dbInsDemonstrativo.Free;
  _dbElemDemo.Free;
  _dbCompoElemDem.Free;
  CtrlDemonstrativo.Free;
  cdsDemoDest.Free;
  cdsElemDemo.Free;
  cdsCompElemDem.Free;

end;

function TCtrlElemDemonstrativo.ListElemDemo(dDemo:Double):OleVariant;
var
  sSql :string;
begin
    sSql := 'SELECT ' +
            '       IDELEMDEMONSTRAT, ELEDESCELEM, IDDEMONSTRATIVO, ' +
            '       ELETIPOELEM, ELEORDEM, FLGINDENTACAO, FLGTIPOLINHA, ' +
            '       ELEORDEMLINHA, IDELEMANAVERTICAL, FLGTIPONEGATIVO, ' +
            '       FLGNATUREZA, FLGTRACO, FLGNEGRITO, FLGMONETARIA, ' +
            '       FLGSALTAPAGINA, FLGDECIMAIS, ELECODIGO, IDELEMANAVERT1, '+
            '       FLGACUMULADO, 0 AS NOVOCODIGO ' +
            'FROM ' +
            '   ELEMDEMONSTRATIVO ' +
            'WHERE ' +
            '   (IDDEMONSTRATIVO  = ' + FloatToStr(dDemo) + ')';



     result := GetDataPacket(sSql);

end;


function TCtrlElemDemonstrativo.ListCompElemDem(dIdElemdemo:Double):OleVariant;
var
  sSql :string;
begin
    sSql := 'SELECT ' +
            '   IDCOMPOELEMDEM, CODSUBCONTA, IDPLANOPREV, ' +
            '   IDPESSOA, IDPATRO, IDEMPRESA, CODCENTROCUSTO, ' +
            '   UNIDNEGOC, PLANO, PLACONTA, IDELEMDEMONSTRAT, ' +
            '   ELEMENTODEM, FLGOPERACAO, ELECONDICAO, ' +
            '   ELETIPOCOND, ELEDEMCOND, ELEVALORCOND ' +
            '  FROM ' +
            '     COMPOELEMDEM ' +
            '  WHERE  ' +
            '     (IDELEMDEMONSTRAT = ' + FloatToStr(dIdElemdemo) + ') ';



     result := GetDataPacket(sSql);

end;



function TCtrlElemDemonstrativo.CopiarDemonstrativo(rgEscolha,iDemoOri,iDemoDes,iEmpresaProp:Integer) :Boolean;
var
  iCodDemo,iCodElemDem :Integer;
  sSql :string;

  sqlUpdElemVert1    :TCMSqlParams;
  sqlUpdElemVert     :TCMSqlParams;
  sqlUpdElemComp     :TCMSqlParams;
  sqlInsDemo         :TCMSqlParams;
  sqlInsElemDemo     :TCMSqlParams;
  sqlInsCompoElemDem :TCMSqlParams;

  cdsDemoDest     :TClientDataSet;
  cdsElemDemo     :TClientDataSet;
  cdsCompoElemDem :TClientDataSet;
begin

  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.CopiarDemonstrativoAPS(rgEscolha,iDemoOri,iDemoDes,iEmpresaProp);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else
  Begin
     cdsCompoElemDem := TClientDataSet.Create(nil);
     //===============================================
     // Cria os cds
     //===============================================
      cdsDemoDest := TClientDataSet.Create(nil);
      sSql := 'SELECT IDDEMONSTRATIVO, DEMDESCDEMONSTRAT, IDPESSOA,       ' +
              '       DEMNATUREZA, DEMTIPO, DEMSEQUENCIA, DEMTITULOCOMPL, ' +
              '       FLGTRACOACIMA, FLGTRACOABAIXO, DEMTITULOCOMPL2      ' +
              'FROM  DEMONSTRATIVO                                        ' +
              'WHERE (IDDEMONSTRATIVO = ' + IntToStr(iDemoOri) + ')' +
              'ORDER BY DEMDESCDEMONSTRAT ';
      cdsDemoDest.Data := GetDataPacket(sSql);
     //
      cdsElemDemo := TClientDataSet.Create(nil);
      sSql := 'SELECT IDELEMDEMONSTRAT, ELEDESCELEM, IDDEMONSTRATIVO,       ' +
              '    ELETIPOELEM, ELEORDEM, FLGINDENTACAO, FLGTIPOLINHA,      ' +
              '    ELEORDEMLINHA, IDELEMANAVERTICAL, FLGTIPONEGATIVO,       ' +
              '    FLGNATUREZA, FLGTRACO, FLGNEGRITO, FLGMONETARIA,         ' +
              '    FLGSALTAPAGINA, FLGDECIMAIS, ELECODIGO, IDELEMANAVERT1,  ' +
              '    FLGACUMULADO, 0 AS NOVOCODIGO                            ' +
              'FROM ELEMDEMONSTRATIVO                                       ' +
              'WHERE  (IDDEMONSTRATIVO  = ' + IntToStr(iDemoOri) + ')';
      cdsElemDemo.Data := GetDataPacket(sSql);

     //===============================================
     // Cria os sql
     //===============================================
      sqlInsElemDemo  := TCMSqlParams.Create(nil);
      sqlInsElemDemo.ControlObject := Self;

      sqlInsDemo  := TCMSqlParams.Create(nil);
      sqlInsDemo.ControlObject := Self;

      sqlUpdElemVert1  := TCMSqlParams.Create(nil);
      sqlUpdElemVert1.ControlObject := Self;

      sqlUpdElemVert  := TCMSqlParams.Create(nil);
      sqlUpdElemVert.ControlObject := Self;

      sqlUpdElemComp  := TCMSqlParams.Create(nil);
      sqlUpdElemComp.ControlObject := Self;

      sqlInsCompoElemDem  := TCMSqlParams.Create(nil);
      sqlInsCompoElemDem.ControlObject := Self;
     // Preenche com a sintáxe dos sqls
      sqlUpdElemComp.SQL.Clear;
      sqlUpdElemComp.SQL.Add('UPDATE COMPOELEMDEM C                                                         ');
      sqlUpdElemComp.SQL.Add('SET C.ELEMENTODEM = :IDELEMANAVERTICALN                                       ');
      sqlUpdElemComp.SQL.Add('WHERE (C.ELEMENTODEM = :IDELEMANAVERTICALV)                                   ');
      sqlUpdElemComp.SQL.Add('  AND (C.IDELEMDEMONSTRAT IN (SELECT E.IDELEMDEMONSTRAT                       ');
      sqlUpdElemComp.SQL.Add('                            FROM ELEMDEMONSTRATIVO E                          ');
      sqlUpdElemComp.SQL.Add('                            WHERE (E.IDDEMONSTRATIVO = :IDDEMONSTRATIVO)      ');
      sqlUpdElemComp.SQL.Add('                              AND (E.IDELEMDEMONSTRAT = C.IDELEMDEMONSTRAT))) ');
      //
      sqlUpdElemVert1.SQL.Clear;
      sqlUpdElemVert1.SQL.Add('UPDATE ELEMDEMONSTRATIVO                      ');
      sqlUpdElemVert1.SQL.Add('SET IDELEMANAVERT1     = :IDELEMANAVERTICALN  ');
      sqlUpdElemVert1.SQL.Add('WHERE (IDELEMANAVERT1  = :IDELEMANAVERTICALV) ');
      sqlUpdElemVert1.SQL.Add('  AND (IDDEMONSTRATIVO = :IDDEMONSTRATIVO)    ');
      //
      sqlUpdElemVert.SQL.Clear;
      sqlUpdElemVert.SQL.Add('UPDATE ELEMDEMONSTRATIVO                        ');
      sqlUpdElemVert.SQL.Add('SET IDELEMANAVERTICAL    = :IDELEMANAVERTICALN  ');
      sqlUpdElemVert.SQL.Add('WHERE (IDELEMANAVERTICAL = :IDELEMANAVERTICALV) ');
      sqlUpdElemVert.SQL.Add('  AND (IDDEMONSTRATIVO   = :IDDEMONSTRATIVO)    ');
      //
      sqlInsDemo.SQL.Clear;
      sqlInsDemo.SQL.Add('INSERT INTO DEMONSTRATIVO(IDDEMONSTRATIVO, DEMDESCDEMONSTRAT, IDPESSOA, ');
      sqlInsDemo.SQL.Add('       DEMNATUREZA, DEMTIPO, DEMSEQUENCIA, DEMTITULOCOMPL,              ');
      sqlInsDemo.SQL.Add('       FLGTRACOACIMA, FLGTRACOABAIXO, DEMTITULOCOMPL2)                  ');
      sqlInsDemo.SQL.Add('VALUES                                                                  ');
      sqlInsDemo.SQL.Add('(:IDDEMONSTRATIVO, :DEMDESCDEMONSTRAT, :IDPESSOA,                       ');
      sqlInsDemo.SQL.Add('       :DEMNATUREZA, :DEMTIPO, :DEMSEQUENCIA, :DEMTITULOCOMPL,          ');
      sqlInsDemo.SQL.Add('       :FLGTRACOACIMA, :FLGTRACOABAIXO, :DEMTITULOCOMPL2)               ');
      //
      sqlInsElemDemo.SQL.Clear;
      sqlInsElemDemo.SQL.Add('INSERT INTO ELEMDEMONSTRATIVO(IDELEMDEMONSTRAT, ELEDESCELEM, IDDEMONSTRATIVO, ');
      sqlInsElemDemo.SQL.Add('       ELETIPOELEM, ELEORDEM, FLGINDENTACAO, FLGTIPOLINHA,                    ');
      sqlInsElemDemo.SQL.Add('       ELEORDEMLINHA, FLGTIPONEGATIVO,                                        ');
      sqlInsElemDemo.SQL.Add('       FLGNATUREZA, FLGTRACO, FLGNEGRITO, FLGMONETARIA,                       ');
      sqlInsElemDemo.SQL.Add('       FLGSALTAPAGINA, FLGDECIMAIS, ELECODIGO,                                ');
      sqlInsElemDemo.SQL.Add('       FLGACUMULADO, IDELEMANAVERTICAL, IDELEMANAVERT1 )                      ');
      sqlInsElemDemo.SQL.Add('VALUES                                                                        ');
      sqlInsElemDemo.SQL.Add('(:IDELEMDEMONSTRAT, :ELEDESCELEM, :IDDEMONSTRATIVO,                           ');
      sqlInsElemDemo.SQL.Add('       :ELETIPOELEM, :ELEORDEM, :FLGINDENTACAO, :FLGTIPOLINHA,                ');
      sqlInsElemDemo.SQL.Add('       :ELEORDEMLINHA, :FLGTIPONEGATIVO,                                      ');
      sqlInsElemDemo.SQL.Add('       :FLGNATUREZA, :FLGTRACO, :FLGNEGRITO, :FLGMONETARIA,                   ');
      sqlInsElemDemo.SQL.Add('       :FLGSALTAPAGINA, :FLGDECIMAIS, :ELECODIGO,                             ');
      sqlInsElemDemo.SQL.Add('       :FLGACUMULADO, :IDELEMANAVERTICAL, :IDELEMANAVERT1 )                   ');
      //
      sqlInsCompoElemDem.SQL.Clear;
      sqlInsCompoElemDem.SQL.Add('INSERT INTO COMPOELEMDEM(IDCOMPOELEMDEM, CODSUBCONTA, IDPLANOPREV, ');
      sqlInsCompoElemDem.SQL.Add('  IDPESSOA, IDPATRO, IDEMPRESA, CODCENTROCUSTO,                    ');
      sqlInsCompoElemDem.SQL.Add('  UNIDNEGOC, PLANO, PLACONTA, IDELEMDEMONSTRAT,                    ');
      sqlInsCompoElemDem.SQL.Add('  ELEMENTODEM, FLGOPERACAO, ELECONDICAO,                           ');
      sqlInsCompoElemDem.SQL.Add('  ELETIPOCOND, ELEDEMCOND, ELEVALORCOND)                           ');
      sqlInsCompoElemDem.SQL.Add('VALUES (:IDCOMPOELEMDEM, :CODSUBCONTA, :IDPLANOPREV,               ');
      sqlInsCompoElemDem.SQL.Add(' :IDPESSOA, :IDPATRO, :IDEMPRESA, :CODCENTROCUSTO,                 ');
      sqlInsCompoElemDem.SQL.Add(' :UNIDNEGOC, :PLANO, :PLACONTA, :IDELEMDEMONSTRAT,                 ');
      sqlInsCompoElemDem.SQL.Add(' :ELEMENTODEM, :FLGOPERACAO, :ELECONDICAO,                         ');
      sqlInsCompoElemDem.SQL.Add(' :ELETIPOCOND, :ELEDEMCOND, :ELEVALORCOND)                         ');

     //==================================================
     Try
         StartTransaction;

         If rgEscolha = 0 then //Insere demonstrativo
         Begin
           iCodDemo := GetSequence('DEMONSTRATIVO');
            With sqlInsDemo do
            Begin
               Prepare;
               ParamByName('IDDEMONSTRATIVO').AsInteger   := iCodDemo;
               ParamByName('DEMDESCDEMONSTRAT').AsString  := cdsDemoDest.FieldByName('DEMDESCDEMONSTRAT').AsString;
               ParamByName('IDPESSOA').AsInteger          := iEmpresaProp;
               ParamByName('DEMNATUREZA').AsString        := cdsDemoDest.FieldByName('DEMNATUREZA').AsString;
               ParamByName('DEMTIPO').AsString            := cdsDemoDest.FieldByName('DEMTIPO').AsString;
               ParamByName('DEMSEQUENCIA').AsInteger      := cdsDemoDest.FieldByName('DEMSEQUENCIA').AsInteger;
               ParamByName('DEMTITULOCOMPL').AsString     := cdsDemoDest.FieldByName('DEMTITULOCOMPL').AsString;
               ParamByName('FLGTRACOACIMA').AsString      := cdsDemoDest.FieldByName('FLGTRACOACIMA').AsString;
               ParamByName('FLGTRACOABAIXO').AsString     := cdsDemoDest.FieldByName('FLGTRACOABAIXO').AsString;
               ParamByName('DEMTITULOCOMPL2').AsString    := cdsDemoDest.FieldByName('DEMTITULOCOMPL2').AsString;

               If not ExecSQL(SQLChanged,False) Then
                 Raise Exception.Create(MessageInfo);
            End;
         End Else
         Begin
            iCodDemo := iDemoDes;
         End;

         cdsElemDemo.First;
         While not cdsElemDemo.Eof do
         Begin
            iCodElemDem := GetSequence('ELEMDEMONSTRATIVO');
            cdsElemDemo.Edit;
            cdsElemDemo.FieldByName('NOVOCODIGO').AsInteger := iCodElemDem;
            cdsElemDemo.Post;
            With sqlInsElemDemo do
            Begin
               Prepare;
               ParamByName('IDELEMDEMONSTRAT').AsInteger := iCodElemDem;
               ParamByName('ELEDESCELEM').AsString       := cdsElemDemo.FieldByName('ELEDESCELEM').AsString;
               ParamByName('IDDEMONSTRATIVO').AsInteger  := iCodDemo;
               ParamByName('ELETIPOELEM').AsString       := cdsElemDemo.FieldByName('ELETIPOELEM').AsString;
               ParamByName('ELEORDEM').AsString          := cdsElemDemo.FieldByName('ELEORDEM').AsString;
               ParamByName('FLGINDENTACAO').AsString     := cdsElemDemo.FieldByName('FLGINDENTACAO').AsString;
               ParamByName('FLGTIPOLINHA').AsString      := cdsElemDemo.FieldByName('FLGTIPOLINHA').AsString;
               ParamByName('ELEORDEMLINHA').AsInteger    := cdsElemDemo.FieldByName('ELEORDEMLINHA').AsInteger;
               ParamByName('FLGTIPONEGATIVO').AsString   := cdsElemDemo.FieldByName('FLGTIPONEGATIVO').AsString;
               ParamByName('FLGNATUREZA').AsString       := cdsElemDemo.FieldByName('FLGNATUREZA').AsString;
               ParamByName('FLGTRACO').AsString          := cdsElemDemo.FieldByName('FLGTRACO').AsString;
               ParamByName('FLGNEGRITO').AsString        := cdsElemDemo.FieldByName('FLGNEGRITO').AsString;
               ParamByName('FLGMONETARIA').AsString      := cdsElemDemo.FieldByName('FLGMONETARIA').AsString;
               ParamByName('FLGSALTAPAGINA').AsString    := cdsElemDemo.FieldByName('FLGSALTAPAGINA').AsString;
               ParamByName('FLGDECIMAIS').AsString       := cdsElemDemo.FieldByName('FLGDECIMAIS').AsString;
               ParamByName('ELECODIGO').AsString         := cdsElemDemo.FieldByName('ELECODIGO').AsString;
               ParamByName('FLGACUMULADO').AsString      := cdsElemDemo.FieldByName('FLGACUMULADO').AsString;
               if cdsElemDemo.FieldByName('IDELEMANAVERT1').isNull then
                  ParamByName('IDELEMANAVERT1').Clear
               else
                  ParamByName('IDELEMANAVERT1').AsInteger   := cdsElemDemo.FieldByName('IDELEMANAVERT1').AsInteger;
               if cdsElemDemo.FieldByName('IDELEMANAVERTICAL').isNull then
                  ParamByName('IDELEMANAVERTICAL').Clear
               else
                  ParamByName('IDELEMANAVERTICAL').AsInteger:= cdsElemDemo.FieldByName('IDELEMANAVERTICAL').AsInteger;

               If not ExecSQL(SQLChanged,False) Then
                  Raise Exception.Create(MessageInfo);
            End;

            sSql := 'SELECT IDCOMPOELEMDEM, CODSUBCONTA, IDPLANOPREV,     ' +
                    '       IDPESSOA, IDPATRO, IDEMPRESA, CODCENTROCUSTO, ' +
                    '       UNIDNEGOC, PLANO, PLACONTA, IDELEMDEMONSTRAT, ' +
                    '       ELEMENTODEM, FLGOPERACAO, ELECONDICAO,        ' +
                    '       ELETIPOCOND, ELEDEMCOND, ELEVALORCOND         ' +
                    'FROM  COMPOELEMDEM                                   ' +
                    'WHERE (IDELEMDEMONSTRAT = ' + IntToStr(cdsElemDemo.FieldByName('IDELEMDEMONSTRAT').AsInteger) +')';
            cdsCompoElemDem.Data := GetDataPacket(sSql);

            cdsCompoElemDem.First;
            While not cdsCompoElemDem.Eof do
            Begin
               With sqlInsCompoElemDem do
               Begin
                  Prepare;
                  ParamByName('IDCOMPOELEMDEM').AsInteger := GetSequence('COMPOELEMDEM');
                  if cdsCompoElemDem.FieldByName('CODSUBCONTA').isNull then
                     ParamByName('CODSUBCONTA').Clear
                  else
                     ParamByName('CODSUBCONTA').AsInteger := cdsCompoElemDem.FieldByName('CODSUBCONTA').AsInteger;
                  if cdsCompoElemDem.FieldByName('IDPLANOPREV').isNull then
                     ParamByName('IDPLANOPREV').Clear
                  else
                     ParamByName('IDPLANOPREV').AsInteger := cdsCompoElemDem.FieldByName('IDPLANOPREV').AsInteger;
                  if cdsCompoElemDem.FieldByName('IDPESSOA').isNull then
                     ParamByName('IDPESSOA').Clear
                  else
                     ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
                  if cdsCompoElemDem.FieldByName('IDPATRO').isNull then
                     ParamByName('IDPATRO').Clear
                  else
                     ParamByName('IDPATRO').AsInteger := cdsCompoElemDem.FieldByName('IDPATRO').AsInteger;
                  if cdsCompoElemDem.FieldByName('IDEMPRESA').isNull then
                     ParamByName('IDEMPRESA').Clear
                  else
                     ParamByName('IDEMPRESA').AsInteger := iEmpresaProp;
                  if cdsCompoElemDem.FieldByName('CODCENTROCUSTO').isNull then
                     ParamByName('CODCENTROCUSTO').Clear
                  else
                     ParamByName('CODCENTROCUSTO').AsString := cdsCompoElemDem.FieldByName('CODCENTROCUSTO').AsString;
                  if cdsCompoElemDem.FieldByName('UNIDNEGOC').isNull then
                     ParamByName('UNIDNEGOC').Clear
                  else
                     ParamByName('UNIDNEGOC').AsInteger := cdsCompoElemDem.FieldByName('UNIDNEGOC').AsInteger;
                  if cdsCompoElemDem.FieldByName('PLANO').isNull then
                     ParamByName('PLANO').Clear
                  else
                     ParamByName('PLANO').AsInteger := cdsCompoElemDem.FieldByName('PLANO').AsInteger;
                  if cdsCompoElemDem.FieldByName('PLACONTA').isNull then
                     ParamByName('PLACONTA').Clear
                  else
                     ParamByName('PLACONTA').AsString := cdsCompoElemDem.FieldByName('PLACONTA').AsString;
                  ParamByName('IDELEMDEMONSTRAT').AsInteger := iCodElemDem;
                  if cdsCompoElemDem.FieldByName('ELEMENTODEM').isNull then
                     ParamByName('ELEMENTODEM').Clear
                  else
                     ParamByName('ELEMENTODEM').AsInteger := cdsCompoElemDem.FieldByName('ELEMENTODEM').AsInteger;
                  if cdsCompoElemDem.FieldByName('FLGOPERACAO').isNull then
                     ParamByName('FLGOPERACAO').Clear
                  else
                     ParamByName('FLGOPERACAO').AsString := cdsCompoElemDem.FieldByName('FLGOPERACAO').AsString;
                  if cdsCompoElemDem.FieldByName('ELECONDICAO').isNull then
                     ParamByName('ELECONDICAO').Clear
                  else
                     ParamByName('ELECONDICAO').AsString := cdsCompoElemDem.FieldByName('ELECONDICAO').AsString;
                  if cdsCompoElemDem.FieldByName('ELETIPOCOND').isNull then
                     ParamByName('ELETIPOCOND').Clear
                  else
                     ParamByName('ELETIPOCOND').AsString := cdsCompoElemDem.FieldByName('ELETIPOCOND').AsString;
                  if cdsCompoElemDem.FieldByName('ELEDEMCOND').isNull then
                     ParamByName('ELEDEMCOND').Clear
                  else
                     ParamByName('ELEDEMCOND').AsFloat := cdsCompoElemDem.FieldByName('ELEDEMCOND').AsFloat;
                  if cdsCompoElemDem.FieldByName('ELEVALORCOND').isNull then
                     ParamByName('ELEVALORCOND').Clear
                  else
                     ParamByName('ELEVALORCOND').AsFloat := cdsCompoElemDem.FieldByName('ELEVALORCOND').AsFloat;

                  If not ExecSQL(SQLChanged,False) Then
                     Raise Exception.Create(MessageInfo);
               End;
               cdsCompoElemDem.Next;
            End;
            cdsElemDemo.Next;
         End;
         //
         cdsElemDemo.First;
         While not cdsElemDemo.Eof do
         Begin
            With sqlUpdElemVert do
            Begin
               Prepare;
               ParamByName('IDELEMANAVERTICALN').AsInteger := cdsElemDemo.FieldByName('NOVOCODIGO').AsInteger;
               ParamByName('IDELEMANAVERTICALV').AsInteger := cdsElemDemo.FieldByName('IDELEMDEMONSTRAT').AsInteger;
               ParamByName('IDDEMONSTRATIVO').AsInteger    := iCodDemo;

               If not ExecSQL(SQLChanged,False) Then
                  Raise Exception.Create(MessageInfo);
            End;
            With sqlUpdElemVert1 do
            Begin
               Prepare;
               ParamByName('IDELEMANAVERTICALN').AsInteger := cdsElemDemo.FieldByName('NOVOCODIGO').AsInteger;
               ParamByName('IDELEMANAVERTICALV').AsInteger := cdsElemDemo.FieldByName('IDELEMDEMONSTRAT').AsInteger;
               ParamByName('IDDEMONSTRATIVO').AsInteger    := iCodDemo;
               If not ExecSQL(SQLChanged,False) Then
                 Raise Exception.Create(MessageInfo);
            End;
            With sqlUpdElemComp do
            Begin
               Prepare;
               ParamByName('IDELEMANAVERTICALN').AsInteger := cdsElemDemo.FieldByName('NOVOCODIGO').AsInteger;
               ParamByName('IDELEMANAVERTICALV').AsInteger := cdsElemDemo.FieldByName('IDELEMDEMONSTRAT').AsInteger;
               ParamByName('IDDEMONSTRATIVO').AsInteger    := iCodDemo;

               If not ExecSQL(SQLChanged,False) Then
                 Raise Exception.Create(MessageInfo);
            End;
            cdsElemDemo.Next;
         End;

         Commit;
         result := True;
      Except
         RollBack;
         raise;
      End;
      sqlUpdElemVert1.free;
      sqlUpdElemVert.free;
      sqlUpdElemComp.free;
      sqlInsDemo.free;
      sqlInsElemDemo.free;
      cdsDemoDest.free;
      cdsElemDemo.free;
      cdsCompoElemDem.free;
      sqlInsCompoElemDem.free;
 End;


end;

function TCtrlElemDemonstrativo.Gravar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarElemDemo( FcdsMestre.Data, FcdsDetalheConta.Data, FcdsDetalheSoma.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Pai
           Result := ApplyCds(FcdsMestre, _dbElemDemo,[],[] );
           Msg    :=  _dbElemDemo.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Filhos
           Result := ApplyCds(FcdsDetalheConta,_dbCompoElemDem,[_dbElemDemo.Idelemdemonstrat],[_dbCompoElemDem.Idelemdemonstrat] );
           Msg    := _dbCompoElemDem.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsDetalheSoma,_dbCompoElemDem,[_dbElemDemo.Idelemdemonstrat],[_dbCompoElemDem.Idelemdemonstrat]);
           Msg    := _dbCompoElemDem.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;

function TCtrlElemDemonstrativo.Apagar: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ApagarElemDemo ( FcdsDetalheConta.Data, FcdsDetalheSoma.Data, FcdsMestre.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           // Filhos
           Result := ApplyCds(FcdsDetalheConta,_dbCompoElemDem,[],[] );
           Msg    := _dbCompoElemDem.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Result := ApplyCds(FcdsDetalheSoma,_dbCompoElemDem,[],[] );
           Msg    := _dbCompoElemDem.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(FcdsMestre, _dbElemDemo,[],[] );
           Msg    :=  _dbElemDemo.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;

end;


function TCtrlElemDemonstrativo.RetornaElemOrdemLinha(dDemo:Double) :Boolean;
var
   sSql :string;
begin
   {Funcão implementada na Aplicação Servidora}
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.RetornaElemOrdemLinhaAPS(dDemo,FProximaElemOrdemLinha);

      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      Result := True;
      FProximaElemOrdemLinha := 0;

      sSql := 'SELECT DEMSEQUENCIA FROM DEMONSTRATIVO '+
              'WHERE IDDEMONSTRATIVO = ' + FloatToStr(dDemo);

      _cds.Data :=  GetDataPacket(sSql);

      If Not _cds.IsEmpty Then
         FProximaElemOrdemLinha := FProximaElemOrdemLinha + _cds.FieldByName('DEMSEQUENCIA').asInteger;

      sSql := 'SELECT  MAX(ELEORDEMLINHA) AS PROXIMA  ' +
              'FROM ELEMDEMONSTRATIVO ' +
              'WHERE IDDEMONSTRATIVO = ' + FloatToStr(dDemo);

     _cds.Data :=  GetDataPacket(sSql);

     If Not _cds.IsEmpty Then
        FProximaElemOrdemLinha := FProximaElemOrdemLinha +  _cds.FieldByName('PROXIMA').asInteger;
   End;
end;


function TCtrlElemDemonstrativo.ListCdsDetSomatorio(dIdElemDemonstrat :Double) :OleVariant;
var
  sSql :string;
begin
       sSql := 'SELECT                 ' +
                '   C.IDCOMPOELEMDEM,   ' +
                '   ''                  '' as OPERACAO, ' +
                '   ''                         '' as CONDICAO, ' +
                '   C.CODSUBCONTA,      ' +
                '   C.IDPLANOPREV,      ' +
                '   C.IDPESSOA,         ' +
                '   C.IDPATRO,          ' +
                '   C.IDEMPRESA,        ' +
                '   C.CODCENTROCUSTO,   ' +
                '   C.UNIDNEGOC,        ' +
                '   C.PLANO,            ' +
                '   C.PLACONTA,         ' +
                '   C.IDELEMDEMONSTRAT, ' +
                '   C.ELEMENTODEM,      ' +
                '   C.FLGOPERACAO,      ' +
                '   C.ELECONDICAO,      ' +
                '   C.ELETIPOCOND,      ' +
                '   C.ELEDEMCOND,       ' +
                '   E.ELEDESCELEM,      ' +
                '   C.ELEVALORCOND      ' +
               'FROM                   ' +
               '   COMPOELEMDEM C,     ' +
               '   ELEMDEMONSTRATIVO E ' +
               'WHERE                  ' +
               '   (E.IDELEMDEMONSTRAT = C.ELEMENTODEM) AND ' +
               '   (C.IDELEMDEMONSTRAT = ' + FloatToStr(dIdElemDemonstrat) + ')';

        Result := GetDataPacket(sSql);


end;

function TCtrlElemDemonstrativo.ListCdsMestre(dIdElemDemonstrat :Double) :OleVariant;
var
  sSql :string;
begin
         sSql := 'SELECT ' +
                 'E.IDELEMDEMONSTRAT,  ' +
                 'E.IDDEMONSTRATIVO,   ' +
                 'E.ELEDESCELEM,       ' +
                 'E.ELETIPOELEM,       ' +
                 'E.ELEORDEM,          ' +
                 'E.FLGINDENTACAO,     ' +
                 'E.FLGTIPOLINHA,      ' +
                 'E.ELEORDEMLINHA,     ' +
                 'E.IDELEMANAVERTICAL, ' +
                 'E.FLGTIPONEGATIVO,   ' +
                 'E.FLGNATUREZA,       ' +
                 'E.FLGTRACO,          ' +
                 'E.FLGDECIMAIS,       ' +
                 'E.FLGNEGRITO,        ' +
                 'E.FLGMONETARIA,      ' +
                 'E.FLGSALTAPAGINA,    ' +
                 'E.ELECODIGO,         ' +
                 'V.ELEDESCELEM AS ELEDESC100,   ' +
                 'E.IDELEMANAVERT1,              ' +
                 'V1.ELEDESCELEM AS ELEDESC1001, ' +
                 'E.FLGACUMULADO                 ' +
                 'FROM ' +
                 '  ELEMDEMONSTRATIVO E, ' +
                 '  ELEMDEMONSTRATIVO V, ' +
                 '  ELEMDEMONSTRATIVO V1 ' +
                 'WHERE  ' +
                 '  (E.IDELEMDEMONSTRAT  = ' + FloatToStr(dIdElemDemonstrat) + ') AND ' +
                 '  (E.IDELEMANAVERTICAL = V.IDELEMDEMONSTRAT(+))  AND ' +
                 '  (E.IDELEMANAVERT1    = V1.IDELEMDEMONSTRAT(+)) ';

        Result := GetDataPacket(sSql);

end;

function TCtrlElemDemonstrativo.ListCdsDetConta(dIdElemDemonstrat :Double) :OleVariant;
var
  sSql :string;
begin
        sSql := 'SELECT ' +
                '    IDCOMPOELEMDEM,   ' +
                '    CODSUBCONTA,      ' +
                '    IDPLANOPREV,      ' +
                '    IDPESSOA,         ' +
                '    IDPATRO,          ' +
                '    IDEMPRESA,        ' +
                '    CODCENTROCUSTO,   ' +
                '    UNIDNEGOC,        ' +
                '    PLANO,            ' +
                '    PLACONTA,         ' +
                '    IDELEMDEMONSTRAT, ' +
                '    ELEMENTODEM,      ' +
                '    FLGOPERACAO,      ' +
                '    ELECONDICAO,      ' +
                '    ELETIPOCOND,      ' +
                '    ELEDEMCOND,       ' +
                '    ELEVALORCOND      ' +
                'FROM ' +
                '   COMPOELEMDEM  ' +
                'WHERE ' +
                '(IDELEMDEMONSTRAT = ' + FloatToStr(dIdElemDemonstrat) + ' ) AND ' +
                '(PLACONTA IS NOT NULL) ';

        Result := GetDataPacket(sSql);
end;

function TCtrlElemDemonstrativo.ListElemDemonstrativo(iIdDemonstrativo,iIdElemDemonstrat,iIdElemAnaVertical,iIdElemAnaVert1: Double) :OleVariant;
var
  sSql, sFiltro, sOrdena :string;
Begin
       sSql := 'SELECT                           ' +
               '   IDELEMDEMONSTRAT,             ' +
               '   ELEDESCELEM,                  ' +
               '   IDDEMONSTRATIVO,              ' +
               '   ELETIPOELEM,                  ' +
               '   ELEORDEM,                     ' +
               '   FLGINDENTACAO,                ' +
               '   FLGTIPOLINHA,                 ' +
               '   ELEORDEMLINHA,                ' +
               '   IDELEMANAVERTICAL,            ' +
               '   FLGTIPONEGATIVO,              ' +
               '   FLGNATUREZA,                  ' +
               '   FLGTRACO,                     ' +
               '   FLGNEGRITO,                   ' +
               '   FLGMONETARIA,                 ' +
               '   FLGSALTAPAGINA,               ' +
               '   FLGDECIMAIS,                  ' +
               '   ELECODIGO,                    ' +
               '   IDELEMANAVERT1,               ' +
               '   FLGACUMULADO                  ' +
              'FROM                              ' +
              '   ELEMDEMONSTRATIVO              ';

      // parte do filtro
      sFiltro := '';
      If (iIdDemonstrativo > 0) Then
      Begin
         sFiltro :=  'WHERE (IDDEMONSTRATIVO = ' +FloatToStr(iIdDemonstrativo)+') ';
      End;
      //
      if iIdElemDemonstrat > 0 then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (IDELEMDEMONSTRAT = ' +FloatToStr(iIdElemDemonstrat)+') '
         else
            sFiltro := sFiltro +  'AND (IDELEMDEMONSTRAT = '+FloatToStr(iIdElemDemonstrat)+') ';
      End;
      //
      if iIdElemAnaVertical > 0 then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (IDELEMANAVERTICAL = ' +FloatToStr(iIdElemAnaVertical)+') '
         else
            sFiltro := sFiltro +  'AND (IDELEMANAVERTICAL = '+FloatToStr(iIdElemAnaVertical)+') ';
      End;
      //
      if iIdElemAnaVert1 > 0 then
      Begin
         If sFiltro = '' Then
            sFiltro :=  'WHERE (IDELEMANAVERT1 = ' +FloatToStr(iIdElemAnaVert1)+') '
         else
            sFiltro := sFiltro +  'AND (IDELEMANAVERT1 = '+FloatToStr(iIdElemAnaVert1)+') ';
      End;

      sOrdena :=  'ORDER BY  ELEDESCELEM      ';

      sSql := sSql + sFiltro + sOrdena;

      Result := GetDataPacket(sSql);

end;

procedure TCtrlElemDemonstrativo.DoChangeDataBase;
begin
  inherited;
  _dbElemDemo.DataBaseName         := DataBaseName;
  _dbCompoElemDem.DataBaseName     := DataBaseName;
  _dbInsDemonstrativo.DataBaseName := DataBaseName;

end;

procedure TCtrlElemDemonstrativo.SetcdsMestre(const Value: TClientDataSet);
begin
  FcdsMestre := Value;
end;

procedure TCtrlElemDemonstrativo.SetcdsDetalheConta(const Value: TClientDataSet);
begin
  FcdsDetalheConta := Value;
end;

procedure TCtrlElemDemonstrativo.SetcdsDetalheSoma(const Value: TClientDataSet);
begin
  FcdsDetalheSoma := Value;
end;
procedure TCtrlElemDemonstrativo.AfterInitialize;
begin
  inherited;
  CtrlDemonstrativo.initializeas(self);

end;

end.
