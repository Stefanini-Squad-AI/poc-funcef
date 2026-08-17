unit FPBaixamanual;

interface

uses                                       
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, CMProcuraSubTipo, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdbdatetimepicker, uCtrlImportaLancamento,
  CMDateTimePicker, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid,uModulo,
  ComCtrls, Db, DBClient, uCMClientDataSet, uCmSqlParams, uSistema, uCtrlParamIntegra,
  MontaSelect, Wwdatsrc, DBCtrls, CmParamReport, uCMTypes, uFuncaoGeral, JclMath,
  DBGrids, uctrlpadroes ;

type
  TFrmpbaixamanual = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label8: TLabel;
    CPForCli: TCMProcuraForCli;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    EdDoc: TEdit;
    CmbSistema: TCMDBLookupCombo;
    CmbTipo: TCMDBLookupCombo;
    CmbFormas: TCMDBLookupCombo;
    Cmbcontas: TCMDBLookupCombo;
    Dtini: TCMDateTimePicker;
    DtLanc: TCMDateTimePicker;
    SBdoc: TSpeedButton;
    SqlUmPortadorForma: TCMSqlParams;
    CdsUmPortadorForma: TCMClientDataSet;
    SqlTipoDocRecPag: TCMSqlParams;
    CdsTipoDocRecPag: TCMClientDataSet;
    SqlFormaRecPag: TCMSqlParams;
    CdsFormaRecPag: TCMClientDataSet;
    SqlModulo: TCMSqlParams;
    CdsModulo: TCMClientDataSet;
    CmbDataLanc: TComboBox;
    MsDoc: TMontaSelect;
    SqlSelecionados: TCMSqlParams;
    CdsSelecionados: TCMClientDataSet;
    DsSelecionados: TwwDataSource;
    SqlDocVazio: TCMSqlParams;
    CdsPendentes: TCMClientDataSet;
    SqlPendentes: TCMSqlParams;
    DsPendentes: TwwDataSource;
    cdsaux: TCMClientDataSet;
    sqlaux: TCMSqlParams;
    CmpBaixa: TCmParamReport;
    rgselecao: TRadioGroup;
    CmpDadosParaBaixaCAR: TCmParamReport;
    CmpDadosParaBaixaCAP: TCmParamReport;
    SqlPortadorForma: TCMSqlParams;
    CdsPendentesIDFORCLI: TFloatField;
    CdsPendentesOPERACAO: TStringField;
    CdsPendentesCODTIPDOC: TFloatField;
    CdsPendentesIDPESSOA: TFloatField;
    CdsPendentesCODDOCUMENTO: TFloatField;
    CdsPendentesNODOCUMENTO: TFloatField;
    CdsPendentesCOMPLDOCUMENTO: TStringField;
    CdsPendentesDATAPROGRAMADA: TDateTimeField;
    CdsPendentesDATAVENCTO: TDateTimeField;
    CdsPendentesIDMODULO: TFloatField;
    CdsPendentesRECPAG: TStringField;
    CdsPendentesNOME: TStringField;
    CdsPendentesSTATUS: TStringField;
    CdsPendentesMOECODIGO: TFloatField;
    CdsPendentesPLANO: TFloatField;
    CdsPendentesPLACONTA: TStringField;
    CdsPendentesCODSUBCONTA: TFloatField;
    CdsPendentesCODCENTROCUSTO: TStringField;
    CdsPendentesCODGRUPOCNAB: TFloatField;
    CdsPendentesNOSSONUMERO: TStringField;
    CdsPendentesNUMLANCTO: TFloatField;
    CdsPendentesDATALANCTO: TDateTimeField;
    CdsPendentesVLRLIQUIDO: TFloatField;
    CdsPendentesVALOR: TFloatField;
    CdsPendentesVALOROUTRAMOEDA: TFloatField;
    CdsPendentesDEBCRE: TStringField;
    CdsPendentesSITUACAO: TFloatField;
    CdsPendentesSTATUSVALOR: TFloatField;
    CdsPendentesPLANOPREV: TStringField;
    CdsPlanoPrev: TCMClientDataSet;
    dsPlanoPrev: TDataSource;
    sqlplanoprev: TCMSqlParams;
    grpPlanoPrev: TGroupBox;
    dbgrPlanoPrev: TwwDBGrid;
    GBFiltro: TGroupBox;
    CBCC: TCheckBox;
    CBFP: TCheckBox;
    CBdoc: TCheckBox;
    CBlista: TCheckBox;
    Label9: TLabel;
    Edit1: TEdit;
    DtFim: TCMDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBdocClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    private
    { Private declarations }
      procedure AbreQueries;
      procedure LimpaSelecao;
      procedure MontaSQLDocPendentes(sIdPlanos : string);



  public
    { Public declarations }
     CtrlImportaLancamento : TCtrlImportaLancamento;
     
  end;

var
  Frmpbaixamanual: TFrmpbaixamanual;


implementation

uses
FBaixaManualMT;

{$R *.DFM}

procedure TFrmpbaixamanual.AbreQueries;
begin
 If ParamIntegra.RecPag = 'P' Then
  Begin
   if not(SqlUmPortadorForma.Prepared) then SqlUmPortadorForma.Prepare;
   begin
   SqlUmPortadorForma.ParamByName('IDPESSOA').AsFloat := Sistema.IDEmpresa;
   SqlUmPortadorForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
   SqlUmPortadorForma.Open;
   end;
   if not(SqlTipoDocRecPag.Prepared) then SqlTipoDocRecPag.Prepare;
   begin
   SqlTipoDocRecPag.ParamByName('IDUSUARIO').AsFloat := Sistema.IdUsuario;
   SqlTipoDocRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
   SqlTipoDocRecPag.Open;
   end;
   if not(SqlFormaRecPag.Prepared) then SqlFormaRecPag.Prepare;
   begin
   SqlFormaRecPag.ParamByName('IDPESSOA').AsFloat := Sistema.IDEmpresa;
   SqlFormaRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
   SqlFormaRecPag.Open;
   end;
   SqlModulo.Open;
   cblista.Checked :=false;



  

end;

end;  
procedure TFrmpbaixamanual.FormShow(Sender: TObject);
begin
  inherited;
  Abrequeries;
 // CdsPlanoPrev.Data := CtrlImportaLancamento.ListaPlano;
end;

procedure TFrmpbaixamanual.FormCreate(Sender: TObject);
Var
  ParamCapCar: TCollectionItem;
begin
  inherited;
  CmbDataLanc.Items.Clear;
  CmbDataLanc.Items.Add('é igual a ');
  CmbDataLanc.Items.Add('é maior que ');
  CmbDataLanc.Items.Add('é maior ou igual que ');
  CmbDataLanc.Items.Add('é menor que ');
  CmbDataLanc.Items.Add('é menor ou igual que ');
  CmbDataLanc.Items.Add('é diferente de ');

  {   If ParamIntegra.RecPag = 'P' Then
      MsDoc.Filtro.Add('DOCUMENTO.RECPAG = ' + QuotedStr(ParamIntegra.RecPag))
   else
   Begin
     MsDoc.Colunas.Add('DOCUMENTO.NOSSONUMERO');
     MsDoc.Larguras.Add('20');
     MsDoc.Mascaras.Add('');
     MsDoc.Descricao.Add('Nosso Número');
     MsDoc.TipoDeDado.Add('C');
     MsDoc.SensivelACaixa.Add('S');
   end;
LimpaSelecao; }

 If ParamIntegra.RecPag = 'P' Then
  Begin
     CmpBaixa.ParamValues[1].Caption := 'Fornecedor';
     CmpBaixa.ParamValues[1].ProcuraFCSettings.ForCli := fcFornecedor;

     CmpBaixa.ParamValues[2].Caption := 'Contas Caixas X Formas de Pagto.';
     CmpBaixa.ParamValues[3].Caption := 'Formas de Pagamento';

     CmpDadosParaBaixaCAR.ParamValues[0].Caption := CmpBaixa.ParamValues[2].Caption;
     CmpDadosParaBaixaCAR.ParamValues[1].Caption := 'Nº Cheque\Borderô';
     CmpDadosParaBaixaCAP.ParamValues[0].Caption := CmpBaixa.ParamValues[2].Caption;
     CmpDadosParaBaixaCAP.ParamValues[1].Caption := 'Nº Cheque\Borderô';


     ParamCapCar := CmpBaixa.Params.Add;
     TCMParamsItem(ParamCapCar).Caption := 'Lista Doc´s tipo CPMF';
     TCMParamsItem(ParamCapCar).Controle := tcCheckBox;
     TCMParamsItem(ParamCapCar).TipodeDado := tdBoolean;
     TCMParamsItem(ParamCapCar).CheckBoxSetings.Checked := False;
     CtrlImportaLancamento := TCtrlImportaLancamento.Create;
     CtrlImportaLancamento.InitializeAs(Padroes);
     CdsPlanoPrev.Data := CtrlImportaLancamento.ListaPlano;
  End
  Else
  Begin
     MsDoc.Colunas.Add('DOCUMENTO.NOSSONUMERO');
     MsDoc.Larguras.Add('20');
     MsDoc.Mascaras.Add('');
     MsDoc.Descricao.Add('Nosso Número');
     MsDoc.TipoDeDado.Add('C');
     MsDoc.SensivelACaixa.Add('S');

     CmpBaixa.ParamValues[1].Caption := 'Cliente';
     CmpBaixa.ParamValues[1].ProcuraFCSettings.ForCli := fcCliente;

     CmpBaixa.ParamValues[2].Caption := 'Contas Caixas X Tipos de Cobr.';
     CmpBaixa.ParamValues[3].Caption := 'Tipos de Cobrança';

     CmpDadosParaBaixaCAR.ParamValues[0].Caption := CmpBaixa.ParamValues[2].Caption;
     CmpDadosParaBaixaCAR.ParamValues[1].Caption := 'Nº Lote de Recebimento';
     CmpDadosParaBaixaCAP.ParamValues[0].Caption := CmpBaixa.ParamValues[2].Caption;
     CmpDadosParaBaixaCAP.ParamValues[1].Caption := 'Nº Lote de Recebimento';


     ParamCapCar := CmpBaixa.Params.Add;
     TCMParamsItem(ParamCapCar).Caption := 'Grupo CNAB';
     TCMParamsItem(ParamCapCar).Controle := tcEdit;
     TCMParamsItem(ParamCapCar).TipodeDado := tdInteger;
  End;

  SqlPortadorForma.Prepare;
  SqlPortadorForma.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlPortadorForma.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  SqlFormaRecPag.Prepare;
  SqlFormaRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlFormaRecPag.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  SqlTipoDocRecPag.Prepare;
  SqlTipoDocRecPag.ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
  SqlTipoDocRecPag.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;

  CmpBaixa.ParamValues[2].LookupSettings.SQL.Text := SqlPortadorForma.SQLChanged;
  CmpBaixa.ParamValues[3].LookupSettings.SQL.Text := SqlFormaRecPag.SQLChanged;
  CmpBaixa.ParamValues[4].LookupSettings.SQL.Text := SqlTipoDocRecPag.SQLChanged;

  CmpDadosParaBaixaCAR.ParamValues[0].LookupSettings.SQL.Text := SqlPortadorForma.SQLChanged;
  CmpDadosParaBaixaCAP.ParamValues[0].LookupSettings.SQL.Text := SqlPortadorForma.SQLChanged;

  LimpaSelecao;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30032;
    bbtnAjuda.HelpContext := 30032;
  end
  else
  begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
//    HelpContext           := 40034;
//    bbtnAjuda.HelpContext := 40034;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;

procedure TFrmpbaixamanual.SBdocClick(Sender: TObject);
begin
  inherited;
  MsDoc.Executar;
   if MsDoc.RetornouValor then
    EdDoc.Text := MsDoc.ValoresChave[0]
  else
    EdDoc.Text := ' ';
end;

procedure TFrmpbaixamanual.LimpaSelecao;
begin
//  CdsPendentes.Data := SqlDocVazio.Data;
  CdsSelecionados.Data := SqlDocVazio.Data;
end;

procedure TFrmpbaixamanual.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaSelecao;
end;

Procedure TFrmpbaixamanual.MontaSQLDocPendentes(sIdPlanos : string);
Var
   SelectedParam: Array [1..9] of boolean;
   rDifDocumento: Double;
   rdifdoc:integer;
   rdifplano,rdifplano1: string;
Begin
   CdsPendentes.DisableControls;
   CdsSelecionados.DisableControls;
   Cdsaux.DisableControls;
   Try

     SelectedParam[1] := (CmpBaixa.ParamValues[1].AsInteger > 0);
     SelectedParam[2] := (Not CmpBaixa.ParamValues[2].IsNull);
     SelectedParam[3] := (Not CmpBaixa.ParamValues[3].IsNull);
     SelectedParam[4] := (Not CmpBaixa.ParamValues[4].IsNull);
     SelectedParam[5] := (Not CmpBaixa.ParamValues[5].IsNull);
     SelectedParam[6] := (Not CmpBaixa.ParamValues[6].IsNull);
     SelectedParam[7] := (Not CmpBaixa.ParamValues[7].IsNull);
     SelectedParam[8] := (Trim(CmpBaixa.ParamValues[8].AsString) <> '');


     If (ParamIntegra.RecPag = 'P') Then
        SelectedParam[9] := not(CmpBaixa.ParamValues[9].AsBoolean) // "not" by alex 25/06 pend 14223
     Else
        SelectedParam[9] := (Not CmpBaixa.ParamValues[9].AsInteger > 0);




     If CmbDataLanc.text = 'é igual a ' then
        CmbDataLanc. text := '='  ;
     If CmbDataLanc.text = 'é maior que ' then
        CmbDataLanc. text := '>'  ;
     If CmbDataLanc.text = 'é maior ou igual que ' then
        CmbDataLanc. text := '>='  ;
     If CmbDataLanc.text = 'é menor que ' then
        CmbDataLanc. text := '<'  ;
     If CmbDataLanc.text = 'é menor ou igual que ' then
        CmbDataLanc. text := '<='  ;
     If CmbDataLanc.text = 'é diferente de ' then
        CmbDataLanc. text := '<>'  ;



     With SqlPendentes, SQL Do
     Begin
        Clear;

        Add(' SELECT ');
        // Marchetti
        Add('     DECODE(NVL(D.FLGCONTAINVEST,0),0,''Velho'',''Novo'') AS TIPO, ');
        // Fim Marchetti

        Add('     D.IDFORCLI, ');
        Add('     D.OPERACAO, ');
        Add('     D.CODTIPDOC, ');
        Add('     D.IDPESSOA, ');
        Add('     D.CODDOCUMENTO, ');
        Add('     D.NODOCUMENTO, ');
        Add('     D.COMPLDOCUMENTO, ');
        Add('     D.DATAPROGRAMADA, ');
        Add('     D.DATAVENCTO, ');
        Add('     D.RECPAG,');

        // Rodolpho da Silva - 08/12/2005
        Add('     D.IDMODULO,');

        Add(FuncaoGeral.Decode(CmpBaixa.ParamValues[0].AsInteger,1,'P.NOME,','P.RAZAOSOCIAL AS NOME,'));
        Add('     D.STATUS, ');
        Add('     D.MOECODIGO, ');
        Add('     D.PLANO, ');
        Add('     D.PLACONTA, ');
        Add('     D.CODSUBCONTA, ');
        Add('     D.CODCENTROCUSTO, ');
        Add('     D.CODGRUPOCNAB, ');
        Add('     D.NOSSONUMERO, ');
        Add('     L.NUMLANCTO, ');
        Add('     L.DATALANCTO, ');

        //início - andre tavares - 11/05/2006 - achei este erro ao fazer baixa manual, estava lançando o valor bruto do documento ao gerar CPMF
        //Add('     L.VLRLIQUIDO, ');
        Add('     S.SALDO AS VLRLIQUIDO, ');
        //fim - andre tavares - 11/05/2006 - achei este erro ao fazer baixa manual, estava lançando o valor bruto do documento ao gerar CPMF

        Add('     S.SALDO AS VALOR, ');
        Add('     S.SALDOOM AS VALOROUTRAMOEDA, ');
        Add('     L.DEBCRE,');
        Add('     DECODE(SIGN(D.DATAVENCTO - SYSDATE), -1, 1, 0) AS SITUACAO, ');
        Add('     2 AS STATUSVALOR, ');
        //catia p: 22472 20/07/2006
        Add('     NOME||nome||nome||nome AS PLANOPREV ' );
        //
        Add(' FROM ');
        Add('     PESSOA P, ');
        Add('     DOCUMENTO D, ');
        Add('     LANCTODOCUM L, ');
//        Add('     VWSALDODOC S ');

        Add('    (SELECT  DISTINCT D.CODDOCUMENTO, ');
        Add('       SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR),DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1))) AS SALDO, ');
        Add('       SUM(DECODE(D.RECPAG,''P'',DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA*-1,L.VALOROUTRAMOEDA),DECODE(L.DEBCRE,''D'',L.VALOROUTRAMOEDA,L.VALOROUTRAMOEDA*-1))) AS SALDOOM ');
        Add('     FROM LANCTODOCUM L,DOCUMENTO D ');
        Add('     WHERE ');
        Add('       (D.CODDOCUMENTO = L.CODDOCUMENTO) ');
        Add('        AND (D.RECPAG = :RECPAG) ');
        Add('        AND (D.IDPESSOA = :IDPESSOA) ');

          If SelectedParam[1] Then
             Add(' AND (D.IDFORCLI = :IDFORCLI) ');

          If SelectedParam[2] Then
             Add(' AND (D.CODPORTFORMA = :CODPORTFORMA) ');

          If SelectedParam[3] Then
             Add(' AND (D.CODFORMA = :CODFORMA) ');

          If SelectedParam[4] Then
             Add(' AND (D.CODTIPDOC = :CODTIPDOC) ');

          If SelectedParam[5] Then
             Add(' AND (D.IDMODULO = :IDMODULO) ');

          If SelectedParam[6] Then
             Add(' AND (D.DATAPROGRAMADA ' + Dtini.text + ' :DATAPROGRAMADA) ');
          If SelectedParam[8] Then
             Add(' AND (D.CODDOCUMENTO = :CODDOCUMENTO) ');

          If SelectedParam[9] Then
          Begin
             If (ParamIntegra.RecPag = 'P') Then
                 Add(' AND (D.CODTIPDOC <> :CODTIPDOCCPMF) ')
             Else
                 Add(' AND (D.CODGRUPOCNAB ' + CmpBaixa.ParamValues[9].Comparador + ' :CODGRUPOCNAB) ');
          End;
        Add('     GROUP BY D.CODDOCUMENTO) S ');
      

        Add(' WHERE ');

        Add('     (D.CODDOCUMENTO = S.CODDOCUMENTO) AND ');
        Add('     (D.RECPAG = :RECPAG) AND ');
        //Filtro de acordo com autorização de Usuário por tipo de documento
        Add('     (D.CODTIPDOC IN');
        Add('      (');
        Add('       SELECT');
        Add('         CODTIPDOC');
        Add('       FROM');
        Add('         TIPODOCRECPAG A');
        Add('       WHERE');
        Add('         A.RECPAG = :RECPAG AND');
        Add('         NOT EXISTS');
        Add('             (SELECT');
        Add('                *');
        Add('              FROM');
        Add('                USUARIOXTPDOCTO B');
        Add('              WHERE');
        Add('                 RECPAG = :RECPAG AND');
        Add('                 B.IDUSUARIO = :IDUSUARIO)');
        Add('       UNION');
        Add('       SELECT');
        Add('          CODTIPDOC');
        Add('       FROM');
        Add('          TIPODOCRECPAG A');
        Add('       WHERE');
        Add('          A.RECPAG = RECPAG AND');
        Add('          EXISTS');
        Add('             (SELECT');
        Add('                 *');
        Add('              FROM');
        Add('                 USUARIOXTPDOCTO B');
        Add('              WHERE');
        Add('                  RECPAG = :RECPAG AND');
        Add('                  A.CODTIPDOC = B.CODTIPDOC AND');
        Add('                  B.IDUSUARIO = :IDUSUARIO)');
        Add('      )');
        Add('     ) AND ');
        //Fim Filtro de acordo com autorização de Usuário por tipo de documento
        Add(' (D.OPERACAO = L.OPERACAO) AND ');
        Add(' (D.CODDOCUMENTO = L.CODDOCUMENTO) AND (L.ESTORNO IS NULL) AND ');
        Add(' (D.IDPESSOA = :IDPESSOA ) AND ');
        Add(' (D.STATUS=''0'' OR D.STATUS=''1'' OR (D.STATUS IS  NULL)) AND ');
        Add(' (RTRIM(D.OPERACAO) IN (''2'',''3'',''14'')) AND ');
        Add(' (D.IDFORCLI = P.IDPESSOA) AND ');

        //************************************************
        //      Implementação para FUNCEF - Pendencia 14223
        //************************************************
        //************************************************

        Add(' (D.CODDOCUMENTO !=ALL ');
        Add('    (SELECT ');
        Add('        CODDOCUMENTO ');
        Add('     FROM ');
        Add('        LOTEXDOCUM ');
        Add('     WHERE ');
        Add('        FLGBAIXA IS NULL OR FLGBAIXA = ''N''))');


        If SelectedParam[1] Then
           Add(' AND (D.IDFORCLI = :IDFORCLI) ');

        If SelectedParam[2] Then
           Add(' AND (D.CODPORTFORMA = :CODPORTFORMA) ');

        If SelectedParam[3] Then
           Add(' AND (D.CODFORMA = :CODFORMA) ');

        If SelectedParam[4] Then
           Add(' AND (D.CODTIPDOC = :CODTIPDOC) ');

        If SelectedParam[5] Then
           Add(' AND (D.IDMODULO = :IDMODULO) ');

        If SelectedParam[6] Then
           Add(' AND (D.DATAPROGRAMADA ' + DtIni.Text + ' :DATAPROGRAMADA) ');

        If SelectedParam[7] Then
           Add(' AND (L.DATALANCTO ' + CmpBaixa.ParamValues[7].Comparador + ' :DATALANCTO) ');

        If SelectedParam[8] Then
           Add(' AND (D.CODDOCUMENTO = :CODDOCUMENTO) ');

        If SelectedParam[9] Then
        Begin
           If (ParamIntegra.RecPag = 'P') Then
               Add(' AND (D.CODTIPDOC <> :CODTIPDOCCPMF) ')
           Else
               Add(' AND (D.CODGRUPOCNAB ' + CmpBaixa.ParamValues[9].Comparador + ' :CODGRUPOCNAB) ');
        End;

        Add(' ORDER BY P.NOME, D.DATAPROGRAMADA, D.NODOCUMENTO ');

        Prepare;
        ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
        ParamByName('RECPAG').AsString := ParamIntegra.RecPag;

        If SelectedParam[1] Then ParamByName('IDFORCLI').AsInteger := CmpBaixa.ParamValues[1].AsInteger;
        If SelectedParam[2] Then ParamByName('CODPORTFORMA').AsInteger := CmpBaixa.ParamValues[2].AsInteger;
        If SelectedParam[3] Then ParamByName('CODFORMA').AsInteger := CmpBaixa.ParamValues[3].AsInteger;
        If SelectedParam[4] Then ParamByName('CODTIPDOC').AsInteger := CmpBaixa.ParamValues[4].AsInteger;
        If SelectedParam[5] Then ParamByName('IDMODULO').AsInteger :=CmpBaixa.ParamValues[5].AsInteger ;
        If SelectedParam[6] Then ParamByName('DATAPROGRAMADA').AsDate := CmpBaixa.ParamValues[6].AsDateTime;
        If SelectedParam[7] Then ParamByName('DATALANCTO').AsDate := CmpBaixa.ParamValues[7].AsDateTime;

        If SelectedParam[8] Then ParamByName('CODDOCUMENTO').AsInteger := StrToIntDef(CmpBaixa.ParamValues[8].AsString, -1);

        If SelectedParam[9] Then
        Begin
           If (ParamIntegra.RecPag = 'P') Then
              ParamByName('CODTIPDOCCPMF').AsInteger := Modulo.CodDocCPMF
           Else
              ParamByName('CODGRUPOCNAB').AsInteger := CmpBaixa.ParamValues[6]. AsInteger
        End;

        Open;
          //catia - p : 22472 - 20/07/2006
         //VERIFICA SE O DOCUMENTO TEM MAIS DE UM PLANO
         If Not CdsPendentes.isEmpty then
         While Not Cdspendentes.Eof Do
         begin
         rdifplano:=' ';
              With Sqlaux, SQL Do
              Begin
              Clear;
              Add(' select distinct pp.idplanoprev, pp.nome  as planoprev , r.coddocumento ');
              Add(' from planprev pp, planprevcontabil pc, rateiodocum r    ');
              Add(' where pp.idplanoprev = pc.idplanoprevprev and           ');
              Add(' pc.idplanoprev = r.idplanoprev                         ');
              Add(' AND (R.CODDOCUMENTO = :CODDOCUMENTO)                    ');
              if (trim (sIdPlanos) <> '') And (trim (sIdPlanos) <> '0') then
              Add(' AND (r.IDPLANOPREV IN (' + trim(sIdPlanos) + ')) ');

              Add(' union                                                   ');
              Add(' select pc.idplanoprev, pc.nome as planoprev , r.coddocumento          ');
              Add(' from planprevcontabil pc, rateiodocum r                 ');
              Add(' where idplanoprevprev is null and                       ');
              Add(' pc.idplanoprev = r.idplanoprev                        ');
              Add(' AND (R.CODDOCUMENTO = :CODDOCUMENTO)                    ');
              if (trim (sIdPlanos) <> '') And (trim (sIdPlanos) <> '0') then
              Add(' AND (r.IDPLANOPREV IN (' + trim(sIdPlanos) + ')) ');
              prepare;
              ParamByName('CODDOCUMENTO').AsInteger := cdspendentes.fieldbyname('CODDOCUMENTO').ASINTEGER;
              open;
              While Not Cdsaux.Eof Do
              begin
              rdifplano := rdifplano+Cdsaux.FieldByName('planoprev').AsSTRING+';';
              cdsaux.next;
             end;
             if (trim (rdifplano) <> '') And (trim (rdifplano) <> '0') then
             begin
             CdsPendentes.Edit;
             CdsPendentes.fieldbyname('PLANOPREV').Asstring:=rdifplano;
             cdsPendentes.post;
             cdsPendentes.next;
             end
             else
             cdsPendentes.delete;
            end;
           //--------------------------------------
          { if splano <> ''   then
           begin
          If Not CdsPendentes.IsEmpty Then
           Begin
           CdsPendentes.First;
           cdsPlanoprev.First;
           While Not CdsPendentes.Eof Do
           Begin
            //Testa se foi escolhido o Plano Previdenciário
           if cdsPlanoPrev.FieldByName('MARCA').AsString = 'N' Then
           begin
             CdsPendentes.Delete;
             CdsPlanoPrev.Next;
           end
              Else
                 begin
                 CdsPendentes.Next;
                 cdsPlanoPrev.Next;
                 end;
              end;
              end;end; }
        //Verifica se existem documentos já selecionados para baixa
        If Not CdsSelecionados.IsEmpty Then
        Begin
           CdsPendentes.First;
           While Not CdsPendentes.Eof Do
           Begin
              If CdsSelecionados.Locate('CODDOCUMENTO',VarArrayOf([CdsPendentes.FieldByName('CODDOCUMENTO').AsFloat]),[]) Then
              Begin
                 rDifDocumento := CdsPendentes.FieldByName('VALOR').AsFloat - CdsSelecionados.FieldByName('VALOR').AsFloat;

                 If IsFloatZero(rDifDocumento) Then
                    CdsPendentes.Delete
                 Else
                 Begin
                    CdsPendentes.Edit;
                    CdsPendentes.FieldByName('VALOR').AsFloat := rDifDocumento;
                    CdsPendentes.Post;

                    CdsPendentes.Next;
                 End;
              End
              Else
                 CdsPendentes.Next;
           End;
        End;
         end;
         // fim p:22472 catia 20/07/2006
        {
        //Implementar o Procura

        if Trim(EdtDoc.Text) <> '0' then
           sSQL := sSQL + ' Documento.NODOCUMENTO = '+  Trim(EdtDoc.Text) + ' and ';

        if Trim(EdtCompl.Text) <> '' then
           sSQL := sSQL + ' Documento.COMPLDOCUMENTO = '''+  Trim(EdtCompl.Text) + ''' and ';

        }
      
     End;

     CdsPendentes.EnableControls;
     CdsSelecionados.EnableControls;
   Except
     CdsPendentes.EnableControls;
     CdsSelecionados.EnableControls;
     Raise;

   End;
    FrmPBaixaManual.Release;
end;
procedure TFrmpbaixamanual.bbtnConfirmarClick(Sender: TObject);
var idforcli,splano : String;
iplano:integer;
begin
  inherited;
   // If TRIM(CPForCli.TEXT) <> '' Then
   // SqlLote.sql.add(' AND exists (select 1 from documento d,lotexdocum ld where d.idforcli= ' + INTTOSTR(CPForCli.ForCliReg.ID) +
   //   ' and ld.coddocumento=d.coddocumento and ld.numlote=l.numlote)');
  // sAtivProjMarca := '';
  { cdsAtivProjG.First;
   While not cdsAtivProjG.EOF do begin
      if cdsAtivProjG.FieldByName('MARCA').AsString = 'S' then begin
         if sAtivProjMarca = '' then begin
            sAtivProjMarca := trim(IntToStr(cdsAtivProjG.FieldByName('UNIDNEGOC').AsInteger));
         end else begin
            sAtivProjMarca := sAtivProjMarca+','+trim(IntToStr(cdsAtivProjG.FieldByName('UNIDNEGOC').AsInteger));
         end;
      end;
      cdsAtivProjG.Next;
   end;


   if mskAtivProj.text = '' then
      sUnidNegoc := ''
   else
      sAtivProjMarca := '';   }

 if CPForCli.ForCliReg.Id = 0 then
     idforcli := ''
  else
    idforcli := IntToStr(CPForCli.ForCliReg.Id);

  //Testa se foi escolhido o Plano Previdenciário
  cdsPlanoPrev.First;
  while not cdsPlanoPrev.EOF do
  begin
    if cdsPlanoPrev.FieldByName('MARCA').AsString = 'S' Then
    begin
      if (sPlano) = '' Then
        sPlano := trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger))
      else
        sPlano := sPlano + ',' + trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
    End;
    cdsPlanoPrev.Next;
  End;


  //*** passa os paramentos para o componente padrao ***
  CmpBaixa.ParamValues[0].AsInteger  := RgSelecao.Itemindex;
  CmpBaixa.ParamValues[1].AsString   := idforcli;
  CmpBaixa.ParamValues[2].AsString   := Cmbcontas.LookupValue;
  CmpBaixa.ParamValues[3].AsString   := Cmbformas.LookupValue;
  CmpBaixa.ParamValues[4].AsString   := CmbTipo.LookupValue;
  CmpBaixa.ParamValues[5].AsString   := CmbSistema.LookupValue;
  CmpBaixa.ParamValues[6].AsString   := DtIni.text;
  CmpBaixa.ParamValues[7].AsString   := DtLanc.text;
  CmpBaixa.ParamValues[8].AsString   := Eddoc.Text;
  MontaSQLDocPendentes(sPlano);
  FrmBaixaManualMT.CdsPendentes.data := CdsPendentes.Data;

      
end;



end.
