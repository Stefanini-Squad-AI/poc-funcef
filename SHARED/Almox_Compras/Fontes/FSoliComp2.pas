{--------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
Rotina ......: dbLcAtiv
SOL..........: 163982
Kintana......: 1404974
Data.........: 20/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi alterado o combo de Atividade/Projeto para retornar apenas as
               atividades ativas.
--------------------------------------------------------------------------------
{-------------------------------------------------------------------------------
Data      : 20.09.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 26385
Descrição : Previne problemas caso o RAD esteja ativo e não exista tipo de processo vinculado ao mesmo.
--------------------------------------------------------------------------------
Data      : 02.04.2007
Autor     : Antonio Marcos
Pendência : 24180
Descrição : Critica a data de emissão (não pode ser menor que a data atual, se flag estiver ativo).
---------------------------------------------------------------------------------
Data      : 26.12.2006
Autor     : Rodolpho da Silva
Pendência : 23238
Descrição : Incluir no MsResORc o campo IDOPERACAO
---------------------------------------------------------------------------------
Data      : 13.12.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 23860
Descrição : Implementação que trata da questão do grau de grupo de produtos no novo RAD (RAD+)
---------------------------------------------------------------------------------
Data      : 04.12.2006
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 23860
Descrição : Implementação RAD+
---------------------------------------------------------------------------------
Data.....: 01.08.2006
Analista.: Antonio Marcos (amf)
Pendência: 21409
Descrição: Preenchimento default do centro de responsabilidade, selecionado na tela
           de parâmetros do sistema de compras.
--------------------------------------------------------------------------------
// andre tavares - pendência 17580 - 16/05/2005
// andré tavares - pendência 19040 - 27/04/2005
// andré tavares - pendência 18822 - 22/03/2005
// andre tavares - pendencia 18698 - 03/03/2005
// andre tavares - pendência 17127 - 28/12/2004
{******************************************************************************
Data.....: 30/11/2004
Analista.: Bruno Bastos
Pendência: 18113 - (Pendência do Almoxarifado)
Rotina...: CmeDetalheConfirma
Descrição: Tornar os campos Patro, Plano e Programa obrigatórios.
--------------------------------------------------------------------------------
// andre tavares - pendência 17228 - 04/11/2004 - Implementação do combo para buscar o valor unitário pelo valor da última compra ou custo médio
// andre tavares - Pendencia 16979 - 16/09/2004
--------------------------------------------------------------------------------
Data.....: 20/07/2004
Analista.: Marchetti
Pendência: 17147
Rotina...: CmeCadastroConfirma
Descrição: Se o produto não tiver movimento anterior gera o processo RAD
********************************************************************}

unit FSoliComp2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, StdCtrls, ExtCtrls, DBCtrls, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe,  Mask, wwdbedit,
  TB97Ctls, TB97Tlbr, uModulo, TREdit, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CmEventosCadastro,
  ImgList, TB97Tlwn, Wwdotdot, Wwdbcomb, uCtrlArtigo, DBClient,
  uCMClientDataSet, uCtrlPlanPrevContabPatro, uCtrlPadroes, uCmSqlParams,
  uCtrlAlmoxCompra, uCtrlParamIntegra,

  uCtrlRAD, uCtrlRADPlus, uCtrlRADConsModulos;

type

    TGrupos = record
      sGrupo : string;
      fValor : extended;
    end;

    TVetForn = Record
                  IdForn       : LongInt;
                  CodArtigo    : String;
                  IdProdVari   : LongInt;
                  IdItemSoli   : LongInt;
                  CodMedida    : String;
                  Qtde         : Double;
                  ValorUn      : Double;
                  PrazoPag     : Integer;
                  Obs          : String;
                  CodImposto   : LongInt;
                  Aliquota     : Double;
                  BaseCalc     : Double;
                  ValorAgreg   : Double;
                  CodtipRecDes : String;
               End;


  TFrmSoliComp2 = class(TfrmCadMestreDetalheCS)
    DbrgDestino: TDBRadioGroup;
    DbrgAtendida: TDBRadioGroup;
    PnlDatas: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Label12: TLabel;
    lbAlmoxDestino: TLabel;
    dbedSeqSoliComp: TwwDBEdit;
    EdAlmoxaDestino: TEdit;
    Label3: TLabel;
    grpArtigo: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    lblUnidade: TLabel;
    dblkcmbDesc: TwwDBLookupCombo;
    dblkcmbCodArtigo: TwwDBLookupCombo;
    dblkcmbUnidade: TwwDBLookupCombo;
    QryItemSoli: TwwQuery;
    UpItemSoli: TUpdateSQL;
    QryAux: TwwQuery;
    QryValorUn: TwwQuery;
    dbdteNecessidade: TCMDateTimePicker;
    dbdteEmissao: TCMDateTimePicker;
    qryCRespon: TwwQuery;
    grp: TGroupBox;
    Label6: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    Label7: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    qryUnid: TwwQuery;
    dbQtde: TDBRealEdit;
    dbreOBS: TDBRichEdit;
    Label8: TLabel;
    qryConversao: TwwQuery;
    qryAlmoxaOrigem: TwwQuery;
    GpDotOrc: TGroupBox;
    btnOrcamento: TSpeedButton;
    ReResOrc: TRealEdit;
    MsResORc: TMontaSelect;
    qryArtigo: TwwQuery;
    qryArtigoCODARTIGO: TStringField;
    qryArtigoFLGVARIAVEL: TStringField;
    qryArtigoDESCPROD: TStringField;
    qryArtigoDESCRCOMPL: TMemoField;
    qryContrato: TwwQuery;
    qryContratoIDCONTRATOPROD: TFloatField;
    qryContratoRAZAOSOCIAL: TStringField;
    qryContratoCODMEDIDA: TStringField;
    qryContratoVLRUNITARIO: TFloatField;
    qryContratoQTDEESPERADA: TFloatField;
    qryContratoCODARTIGO: TStringField;
    qryContratoIDFORCLI: TFloatField;
    qryContratoPRAZOPAG: TFloatField;
    qryContratoIDCOMPRADOR: TFloatField;
    qryAux1: TwwQuery;
    qryAgregProd: TwwQuery;
    qryAgregProdCODTIPOCUSTAGREG: TFloatField;
    qryForn: TwwQuery;
    qryFornCODESTADO: TStringField;
    qryFornIDPAIS: TFloatField;
    EdValorTotal: TRealEdit;
    twObs: TToolWindow97;
    Panel2: TPanel;
    DBRichEdit1: TDBRichEdit;
    BitBtn1: TBitBtn;
    qryParamCompras: TwwQuery;
    qryParamComprasOPDESTINO: TStringField;
    qryPatro: TwwQuery;
    qryPrograma: TwwQuery;
    dsPatro: TwwDataSource;
    dsPrograma: TwwDataSource;
    qryParamAlmox: TwwQuery;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dblkcmbPlanoPrev: TwwDBLookupCombo;
    dblkcmbPatro: TwwDBLookupCombo;
    dblkcmbPrograma: TwwDBLookupCombo;
    qryParamAlmoxMASCGRUPOPROD: TStringField;
    qryParamAlmoxIDPESSOA: TFloatField;
    qryParamAlmoxCODALTDEVOLUCAO: TFloatField;
    qryParamAlmoxCODTIPDOC: TFloatField;
    qryParamAlmoxEXISTEDV: TStringField;
    qryParamAlmoxRECEBAUTOMATICO: TStringField;
    qryParamAlmoxEXISTECOMPRA: TStringField;
    qryParamAlmoxCODTABPRODUTIL: TStringField;
    qryParamAlmoxEXISTECONTASPAGAR: TStringField;
    qryParamAlmoxEXISTECONTABIL: TStringField;
    qryParamAlmoxFLGINFOVALORUN: TStringField;
    qryParamAlmoxDATAREPRESA: TDateTimeField;
    qryParamAlmoxDATAULTINTEGRA: TDateTimeField;
    qryParamAlmoxTRGDTINCLUSAO: TDateTimeField;
    qryParamAlmoxTRGUSERINCLUSAO: TStringField;
    qryParamAlmoxDATAIMPLANTA: TDateTimeField;
    qryParamAlmoxFLGCONTABGRUPO: TStringField;
    qryParamAlmoxFLGCONTABTRANSF: TStringField;
    qryParamAlmoxPERCREQMAT: TFloatField;
    qryParamAlmoxFLGINTEGRALIVRO: TStringField;
    qryParamAlmoxPERCRECEBCOMOC: TFloatField;
    qryParamAlmoxCODTIPDOCDEVOL: TFloatField;
    qryParamAlmoxIDPATRO: TFloatField;
    qryParamAlmoxIDPLANOPREV: TFloatField;
    qryParamAlmoxNUMNOTANFDEVOL: TFloatField;
    qryParamAlmoxFLGUSAGRUPOREQ: TStringField;
    qryParamAlmoxFLGREQSEMSALDO: TStringField;
    qryParamAlmoxIDPROGRAMA: TFloatField;
    qryParamAlmoxFLGCONBILIZAREQ: TStringField;
    qryParamAlmoxFLGINTEGRAORC: TFloatField;
    GroupBox1: TGroupBox;
    dbcmbTipoValor: TwwDBComboBox;
    dbedValorUn: TDBRealEdit;
    cdsValUnit: TCMClientDataSet;
    qryPlano: TwwQuery;
    dsPlano: TwwDataSource;
    procedure DbrgDestinoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkcmbCodArtigoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkcmbDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkcmbUnidadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure ReResOrcExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure dbcmbTipoValorCloseUp(Sender: TwwDBComboBox;
      Select: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }

    aGrupos : array of TGrupos;

    FlgTestaGrau: boolean;
    iIDProcesso         : Int64;
    RADConsultaCompras  : TCtrlRADConsultaCompras;
    RADPlus             : TCtrlRADPlus;

    RAD: TCtrlRAD;

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

    CtrlAlmoxCompra: TCtrlAlmoxCompra;
    cdsParamCompras: TClientDataSet;

    procedure FazerQryPrincipal;
    procedure SelecionaFilhos;
    procedure AtualizaComboUnidade(codproduto:string);
    Function  ConvertCustoMed(qryCM :TwwQuery;unidade:string;
                              codAlmoxarifado :integer;codArtigo :string):single;
    Function ExistProcesso( n, iIdItemSoli : LongInt ) : Boolean;
    Function BuscaTipos(idReserva : LongInt; sCodArt:String) : Boolean;
    Procedure ViewContrato( sCodArt : String );
    Function GeraOC : Boolean;
    Function VerifCotacao( n : int64 ) : Boolean;
    Function VerifSCIJaCotacao( N : Double) : Boolean;
    Procedure CalcImposto( sCODPRODUTO, sCODUF : String; iIDPAIS, iCODTIPOCUSTAGREG : LongInt; rValorItem : Double; var rBase : Double; var rPerc : Double; var rValorImp : Double); //(*)

    function ValUnitUltCompra(codArtigo: string): Extended;
  public
     Function  CalculaValorTotal: Real;
    { Public declarations }
  end;




var
  FrmSoliComp2: TFrmSoliComp2;
  rValorTotal: Real;
  iNumSoliComp: LongInt;
  sSQLIncFields, sSQLIncValues, sSql: string;
  iIdTipoProcesso : LongInt;
  iGrauGrupo      : Integer;
  sGrupoProd      : String;
  sNumOC          : String;


implementation




Uses  USistema, UDataBase, UAutorizacao, DBaseDados,
      UMensErro,uFuncaoGeral,uConversaoMed,uOrcamento,
      uIntegraBack,FViewContrato, uString,uImpostoRetido;

{$R *.DFM}
Function  TFrmSoliComp2.ConvertCustoMed(qryCM :TwwQuery;unidade:string;codAlmoxarifado :integer;
                              codArtigo :string):single;
begin
 QryCM.Close;
 QryCM.Sql.Clear;
 QryCM.Sql.Text:= ' Select (C.CustoMedio*V2.FATOR)/V.FATOR AS CUSTOMEDIO '+
                ' From CustoMed C, Almox AL,ARTIGO A,PRODUTO P,CONVER V,CONVER V2 '+
                ' where (C.CodArtigo = '''+codartigo+''') AND '+
                ' (C.CODARTIGO=A.CODARTIGO) AND '+
                ' (A.CODPRODUTO=P.CODPRODUTO) AND '+
                ' (C.CodCusteio = AL.CodCusteio) AND '+
                ' (AL.CodAlmoxarifado = '+IntToStr(codalmoxarifado)+') AND '+
                ' (P.CODPRODUTO=V.CODPRODUTO) AND '+
                ' (P.CODMEDCUSTO=V.CODMEDIDA) AND '+
                ' (V2.CODMEDIDA='''+unidade+''') AND '+
                ' (P.CODPRODUTO=V2.CODPRODUTO) ';
 QryCM.Open;
 Result:=QryCM.fieldByName('CUSTOMEDIO').AsFloat;
end;



procedure TFrmSoliComp2.AtualizaComboUnidade(codproduto:string);
begin
 qryConversao.close;
 qryConversao.ParambyName('codproduto').asstring := TRIM(Codproduto);
 qryConversao.open;
 dblkcmbUnidade.text:='';
 if not qryConversao.IsEmpty then
     begin
       lblUnidade.enabled     := True;
       dblkcmbUnidade.enabled := True;
     end
 else
     begin
       lblUnidade.enabled     := False;
       dblkcmbUnidade.enabled := False;
     end
end;




procedure TFrmSoliComp2.CmeCadastroDelete(Sender: TObject);
var bOK     : Boolean;
    iNumOC  : LongInt;
    iIdProcessoOld:integer;
begin
  bOK    := True;
  If VerifSCIJaCotacao(QryItemSoli.FieldByName('NUMSOLCOMPRA').AsFloat) Then
     Begin
        MsgDlg( 'Existem itens já em Ordem de Compras. Exclusão proibida','Erro',mtError,[mbOk],0);
        Exit;
     End;
  qryItemSoli.First;
  While not qryItemSoli.eof do
  Begin
    if (Format('%17.2f',[QryItemSoli.FieldByName('SALDOACOMPRAR').AsFloat]) <> Format('%17.2f',[QryItemSoli.FieldByName('QTDEPEDIDA').AsFloat])) and (QryItemSoli.FieldByName('IDCONTRATOPROD').IsNull) then
    Begin
       bOK:=False;
       Break;
    end;
    qryItemSoli.Next;
  end;
  if not bOK then
     Begin
        MsgDlg('Este Solicitação não pode ser excluida, pois já existem itens comprados. Escolha a opção alterar e exclua os itens solicitados.','Erro',mtError,[mbOk],0);
        FuncaoGeral.TiraIcone;
        exit;
     end;
  If ExistProcesso(qry.FieldByName('NumSolCompra').AsInteger,-1) Then
     Begin
        MsgDlg('Este Solicitação não pode ser excluida, pois já existem itens em processo de compra','Erro',mtError,[mbOk],0);
        FuncaoGeral.TiraIcone;
        Exit;
     End;
  try
    StartTransacao;
    iNumSoliComp:= qry.FieldByName('NumSolCompra').AsInteger;
    If FazQuery( qryAux1,' SELECT                 '+
                         '      A.IDITEMOC,       '+
                         '      A.IDITEMSOLI,     '+
                         '      B.QTDERECEBIDA,   '+
                         '      B.NUMOC           '+
                         ' FROM SCITEMOC A, '+
                         '      ITEMOC B    '+
                         ' WHERE ( A.NUMSOLCOMPRA = '+ IntToStr(iNumSoliComp) + ')'+
                         '   AND ( A.IDITEMOC = B.IDITEMOC ) '+
                         ' ORDER BY B.NUMOC ')
    Then
       Begin
          if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM SCITEMOC WHERE ( NUMSOLCOMPRA = '+ IntToStr(iNumSoliComp)+')') Then
             Abort;
          iNumOC:=-1;
          qryAux1.First;
          While Not qryAux1.EOF Do
             Begin
                 If qryAux1.FieldByName('QTDERECEBIDA').asFloat <> 0 Then
                    Begin
                        MsgDlg('Solicitação não pode ser excluida. Existem itens já recebidos','Erro',mtError,[mbOk],0);
                        Abort;
                    End;
                 if iNumOC <> qryAux1.FieldByName( 'NumOC' ).AsInteger then begin
                    iNumOC := qryAux1.FieldByName( 'NumOC' ).AsInteger;

                    if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM PRAZOENTREGAOC WHERE ( IDITEMOC = (SELECT IDITEMOC FROM ITEMOC WHERE NUMOC = '+ IntToStr( iNumOC )+'))') Then
                      Abort;

                    if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM PRAZOPGTOOC WHERE ( IDITEMOC = (SELECT IDITEMOC FROM ITEMOC WHERE NUMOC = '+ IntToStr( iNumOC )+'))') Then
                      Abort;

                    if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM AGREGITEMOC WHERE ( IDITEMOC = (SELECT IDITEMOC FROM ITEMOC WHERE NUMOC = '+ IntToStr( iNumOC )+'))') Then
                      Abort;

                    if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM AGREGTOTOC WHERE ( NUMOC = '+ IntToStr( iNumOC )+')') Then
                      Abort;

                    if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM ITEMOC WHERE ( NUMOC = '+ IntToStr( iNumOC )+')') Then
                      Abort;

                    if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM OC WHERE ( NUMOC = '+ IntToStr( iNumOC )+')') Then
                      Abort;
                 end;
                 qryAux1.Next;
             End;
       End;

    if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM ITEMSOLI WHERE ( NUMSOLCOMPRA = '+ IntToStr(iNumSoliComp)+')') Then
      Abort;

    if Sistema.UsaRAD then
    begin
      if Sistema.VersaoRad = '+' then
      begin
         iIdProcessoOld := RADConsultaCompras.RecuperaIdProcessoNaSolicitacao(iNumSoliComp);
         RADPlus.ExcluirProcesso(iIdProcessoOld);
      end
      else
      begin
        if Not ExecutarQuery(DtmBaseDados.qry,'UPDATE RADINSTPROCESSO SET FLGOK = ''E'' WHERE IDPROCESSO = (SELECT IDPROCESSO FROM SOLICOMP WHERE NUMSOLCOMPRA = '+ IntToStr(iNumSoliComp)+')') Then
          Abort;
      end;
    end;

    if Not ExecutarQuery(DtmBaseDados.qry,'DELETE FROM SOLICOMP WHERE ( NUMSOLCOMPRA = '+ IntToStr(iNumSoliComp)+')') Then
      Abort;
    If Orcamentoback.IdReserva <> 0 Then
       Begin
          If OrcamentoBack.EstornaReserva(OrcamentoBack.NumReserva,True) <> 0 Then
             Abort;
       End;

    CommitTransacao;
  except
    MsgDlg('Exclusão Não Efetuada','Erro',mtError,[mbOk],0);
    FuncaoGeral.TiraIcone;
    RollBackTransacao;
  end;
  iNumSoliComp:=0;
  FazerQryPrincipal;
  SelecionaFilhos;
end;


Procedure TFrmSoliComp2.CmeCadastroConfirma(Sender: TObject);
Var sSql          : String;
    iNumComprador : Integer;
    iIdComprador  : Integer;
    iIdProcessoOld: integer;
    i : integer;
    fMaior : extended;
    sGrupo, sAux : string;
    bEnc : boolean;
Begin
    iNumComprador := 1;
    iNumSoliComp:= qry.FieldByName('NumSolCompra').AsInteger;
    qry.FieldByName('CODALMOXARIFADO').asInteger := Modulo.iCodAlmoxa;
    Try
        StartTransacao;
        If GpDotOrc.Enabled Then
          Begin
              If Orcamentoback.IdReserva <> 0 Then
                 qry.FieldByName('IdReservaOrcamen').AsInteger := Orcamentoback.IdReserva;
              If OrcamentoBack.MarcaReserva(Trunc(ReResOrc.Value),True) <> 0 Then
                 Abort;
          End;

        if (Sistema.UsaRAD) then
        begin
          if (Sistema.VersaoRAD = '+') then
          begin
              iIdProcessoOld := RAdConsultaCompras.RecuperaIdProcessoNaSolicitacao(iNumSoliComp);
              RADPlus.ExcluirProcesso(iIdprocessoOld);
              RADPlus.InicializaPropriedades;
              RADPLus.IdEventoGerador     := 3;
              RADPLus.TipoProcesso        := iIdTipoProcesso;
              RadPlus.IdUsuario           := Sistema.IdUsuario;
              RadPlus.CodCentroRespon     := dblcCentRespon.LookupValue;
              RadPlus.UnidNegoc           := StrToInt(dblcAtiv.LookupValue);
              RadPlus.OBS                 := 'S.C.I. Número : '+IntToStr(iNumSoliComp);
              RadPlus.VlrProc             := EdValorTotal.Value;

              if RadPlus.VlrProc = 0 then RadPlus.VlrProc := 0.001;

              RadPlus.idEmpresa       := Sistema.IdEmpresa;

              If qry.FieldByName('CUSTOESTOQUE').AsString = 'E' Then
                 RadPlus.CodCentroCusto  := modulo.sCCustoAlmoxa
              Else
                 RadPlus.CodCentroCusto  := modulo.sCodCCusto;

              RadPlus.CodGrupoProd := '';
              SetLength( aGrupos, 0 );
              QryItemSoli.First;
              while not QryItemSoli.Eof do
              begin
                sAux := Modulo.LeGrupoProd( QryItemSoli.FieldByName('CODARTIGO').AsString );
                bEnc := False;
                for i := 0 to High( aGrupos ) do
                begin
                  if aGrupos[i].sGrupo = sAux then
                  begin
                    aGrupos[i].fValor := aGrupos[i].fValor + QryItemSoli.FieldByName('VALORTOTAL').AsFloat;
                    bEnc := True;
                    break;
                  end;
                end;
                if not bEnc then
                begin
                  SetLength( aGrupos, length( aGrupos ) + 1 );
                  aGrupos[High(aGrupos)].sGrupo := sAux;
                  aGrupos[High(aGrupos)].fValor := QryItemSoli.FieldByName('VALORTOTAL').AsFloat;
                end;
                QryItemSoli.Next;
              end;
             fMaior := aGrupos[0].fValor;
             sGrupo := aGrupos[0].sGrupo;
              for i := 0 to High( aGrupos ) do
              begin
                if aGrupos[i].fValor > fMaior then
                begin
                  fMaior := aGrupos[i].fValor;
                  sGrupo := aGrupos[i].sGrupo
                end;
              end;
              RadPlus.CodGrupoProd := sGrupo;

              iIdProcesso := RadPlus.IniciarProcesso;

              if ( iIdProcesso = 0 ) then
              begin
                 if ( (radPlus.RecuperaTipoProcesso(3, sistema.IdEmpresa) > 0)  or
                     (edValorTotal.Value <> 0 ) ) then
              begin
                 MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
                 Abort;
              end;
              end;

              if iIDProcesso > 0 then
                 qry.FieldByName('IDPROCESSO').AsInteger := iIDProcesso;
          end
          else
          begin
          If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) Then
             Begin
                 if Not ExecutarQuery(DtmBaseDados.qry,'UPDATE RADINSTPROCESSO SET FLGOK = ''E'' WHERE IDPROCESSO = (SELECT IDPROCESSO FROM SOLICOMP WHERE NUMSOLCOMPRA = '+ IntToStr(iNumSoliComp)+')') Then
                   exit;

                 Rad.TipoProcesso    := iIdTipoProcesso;
                 Rad.IdPessoa        := Sistema.IdEmpresa;
                 RAD.IdUsuario       := Sistema.IdUsuario;
                 Rad.CodCentroRespon := dblcCentRespon.LookupValue;
                 Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
                 Rad.OBS             := 'S.C.I. Número : '+IntToStr(iNumSoliComp);
                 Rad.Valor           := EdValorTotal.Value;

                 // O RAD somente gera processo se o valor informado for
                 // maior que o valor minimo parametrizado na tabela RADTIPOPROCESSO
                 // Como o mínimo está zerado e o valor passado é igual a zero,
                 // é passado 0.001 para que o RAD gere o processo normalmente
                 if Rad.Valor = 0 then Rad.Valor := 0.001;

                 Rad.CodGrupoProd    := sGrupoProd;
                 Rad.idEmpresa       := Sistema.IdEmpresa;
                 If qry.FieldByName('CUSTOESTOQUE').AsString = 'E' Then
                    Rad.CodCentroCusto  := modulo.sCCustoAlmoxa
                 Else
                    Rad.CodCentroCusto  := modulo.sCodCCusto;
                 //
                 iIDProcesso := Rad.IniciarProcesso;
                 if (iIDProcesso < 0) and  (EdValorTotal.Value <> 0) then
                 begin
                    Begin
                        MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
                        Abort;
                    End

                 end;
                 if iIDProcesso > 0 then
                    qry.FieldByName('IDPROCESSO').AsInteger := iIDProcesso;
             End;
          end;
        end;

        qry.ApplyUpdates;
        qryItemSoli.ApplyUpdates;
        If sbtnInserir.Down Then
           If Not GeraOC Then
             Abort;
        CommitTransacao;
        MsgDlg('Nº da SCI : '+IntToStr(iNumSoliComp),'Informação',mtInformation,[mbOk],0);
        if Trim(sNumOC) <> '' Then
           MsgDlg('Nº da O.C.(s) : '+sNumOC,'Informação',mtInformation,[mbOk],0);
    Except
        RollBackTransacao;
        Raise;
    End;

    If ( Sistema.IdModulo = 113 ) And (sbtnInserir.Down ) Then
    Begin
        sSql := 'SELECT C.IDPESSOA FROM COMPRADOR C, PESSOA P WHERE C.IDPESSOA = P.IDPESSOA';
        If FazQuery( DtmBaseDados.qry, sSql ) then
        Begin
           While Not DtmBaseDados.qry.EOF Do
           Begin
              Inc( iNumComprador );
              DtmBaseDados.qry.Next;
           End;
           If iNumComprador = 1 Then
           Begin
              DtmBaseDados.qry.First;
              iIdComprador := DtmBaseDados.qry.FieldByName( 'idPessoa' ).AsInteger;
              If Not DtmBaseDados.qry.isEmpty Then
              Begin
                 If MsgDlg('Deseja atribuir esta Solicitação (Nº ' + Trim(IntToStr(iNumSoliComp))+') ao único Comprador cadastrado agora?','Atenção',mtInformation,[mbYes,mbNo],0) = mrYes Then
                 Begin
                    sSql := 'UPDATE ITEMSOLI SET IDCOMPRADOR = '+ IntToStr( iIdComprador ) +
                            ' Where NUMSOLCOMPRA = ' + IntToStr( iNumSoliComp );
                    If Not ExecutarQuery( DtmBaseDados.qry, sSql ) then MsgDlg( 'Erro na atribuição do Comprador','Erro',mtError,[mbOk],0);
                 End;
              End;
           End;
        End;
    End;
    inherited;
    FazerQryPrincipal;
    SelecionaFilhos;
    If Modulo.bVeioAnalise Then
      Begin
        sSql:='UPDATE ANALISEESTOQUE SET FLGACEITA = ''S'' WHERE '+
              '(IDANALISEESTOQUE = '+IntToStr(Modulo.idAnalise)+')';
        ExecutarQuery(qryAux,sSql);
        bbtnSair.Click;
      End;

end;




Procedure TFrmSoliComp2.CmeDetalheConfirma(Sender: TObject);
Var rQtdPedida, rValorUn: Real;
    Tam : Integer;
Begin
  If (QryItemSoli.State = dsInsert) or (QryItemSoli.State = dsEdit) Then
  Begin
     if Trim(dblkcmbPlanoPrev.Text) = '' then
     begin
         MsgDlg('Plano Previdenciário não preenchido','Aviso',mtWarning,[mbOk],0);
         dblkcmbPlanoPrev.SetFocus;
         Exit;
     end;

     if Trim(dblkcmbPatro.Text) = '' then
     begin
         MsgDlg('Patrocinadora não preenchida','Aviso',mtWarning,[mbOk],0);
         dblkcmbPatro.SetFocus;
         Exit;
     end;

     if Trim(dblkcmbPrograma.Text) = '' then
     begin
         MsgDlg('Programa não preenchido','Aviso',mtWarning,[mbOk],0);
         dblkcmbPrograma.SetFocus;
         Exit;
     end;

     if not CtrlPlanPrevContabPatro.ValidaPlanoPatro( StrToInt(dblkcmbPatro.LookupValue), StrToInt(dblkcmbPlanoPrev.LookupValue) ) then
     begin
         MsgDlg('Não existe relacionamento entre Patrocinadora e Plano escolhidos!','Aviso',mtWarning,[mbOk],0);
         dblkcmbPlanoPrev.SetFocus;
         Exit;
     end;

     If Trim(dblkcmbCodArtigo.Text) = '' Then
     Begin
         MsgDlg('Código não preenchido','Aviso',mtWarning,[mbOk],0);
         dblkcmbCodArtigo.SetFocus;
         Exit;
     End;
     If Trim(dblkcmbDesc.Text) = '' Then
     Begin
         MsgDlg('Descrição não preenchida','Aviso',mtWarning,[mbOk],0);
         dblkcmbDesc.SetFocus;
         Exit;
     End;
     If Trim(dblkcmbUnidade.Text) = '' Then
     Begin
         MsgDlg('Unidade não preenchida','Aviso',mtWarning,[mbOk],0);
         dblkcmbUnidade.Enabled:=True;
         dblkcmbUnidade.SetFocus;
         Exit;
     End;
     if ConversaoMed.TestaUnidade(Copy(QryItemSoli.FieldByName('CODARTIGO').AsString,1,6), QryItemSoli.FieldByName('CODMEDIDA').AsString) = -1 then
     Begin
        MsgDlg('Unidade de Medida do Item Inválida. Verifique.','Aviso',mtWarning,[mbOk],0);
        dblkcmbUnidade.Enabled:=True;
        dblkcmbUnidade.SetFocus;
        exit;
     end;
     If dbQtde.value = 0 Then
     Begin
         MsgDlg('Quantidade não pode ser zero','Aviso',mtWarning,[mbOk],0);
         dbQtde.SetFocus;
         Exit;
     End;
     If (OrcamentoBack.IdReserva <> 0) and (not BuscaTipos(OrcamentoBack.IdReserva,dblkcmbCodArtigo.LookupValue)) then
     Begin
         MsgDlg('Este artigo não pode ser solicitado por esta reserva orçamentária','Aviso',mtWarning,[mbOk],0);
         dblkcmbCodArtigo.SetFocus;
         Exit;
     End;
     If DbrgDestino.ItemIndex = 1 then
        Begin
           If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblkcmbCodArtigo.LookUpValue,Modulo.sCodCCusto,Sistema.IdEmpresa)) Then
              Begin
                 MsgDlg('Este Centro de Custo não pode requisitar este produto','Aviso',mtWarning,[mbOk],0);
                 dblkcmbCodArtigo.SetFocus;
                 Exit;
              End;
        End;


     if (FlgTestaGrau)  then
       Begin
          If Trim(sGrupoProd) = '' then
             sGrupoProd := Modulo.LeGrupoProd(dblkcmbCodArtigo.LookupValue)
          Else
             Begin
                 If iGrauGrupo > 0 Then
                    Begin
                       Tam := FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraGrupoProd,iGrauGrupo);
                       If Copy(sGrupoProd,1,Tam) <> Copy(Modulo.LeGrupoProd(dblkcmbCodArtigo.LookupValue),1,Tam) Then
                          Begin
                             MsgDlg('Este produto é de um grupo diferente dos outros produtos selecionados','Aviso',mtWarning,[mbOK],0);
                             dblkcmbCodArtigo.SetFocus;
                             Exit;
                          End;
                    End
                 Else
                    Begin
                       If sGrupoProd <> Modulo.LeGrupoProd(dblkcmbCodArtigo.LookupValue) Then
                         Begin
                             MsgDlg('Este produto é de um grupo diferente dos outros produtos selecionados','Aviso',mtWarning,[mbOK],0);
                             dblkcmbCodArtigo.SetFocus;
                             Exit;
                         End;
                    End;
             End;
       End;

     dblkcmbCodArtigo.Text;
     rQtdPedida := dbQtde.Value;
     rValorUn   := dbedValorUn.Value;
     qryItemSoli.FieldByName('ValorTotal').AsFloat := rQtdPedida*rValorUn;
     qryItemSoli.FieldByName('VALORUN').AsFloat    := rValorUn;


     qryItemSoli.FieldByName('NOMEPLANO').AsString     := qryPlano.FieldByName('NOME').AsString;

     qryItemSoli.FieldByName('NOMEPATRO').AsString     := qryPatro.FieldByName('NOME').AsString;
     qryItemSoli.FieldByName('DESCPROGRAMA').AsString  := qryPrograma.FieldByName('DESCPROGRAMA').AsString;
  end;
  inherited;
end;



procedure TFrmSoliComp2.DbrgDestinoChange(Sender: TObject);
begin
  inherited;
  If DbrgDestino.Value = 'C' Then
  Begin
    lbAlmoxDestino.Caption:= 'Centro Custo Destino:';
    EdAlmoxaDestino.Text:= Modulo.sDescCCusto;
  end
  else
  Begin
    lbAlmoxDestino.Caption:= 'Almoxarifado Destino:';
    EdAlmoxaDestino.Text:= Modulo.sAlmoxaUsuario;
  end;
end;




procedure TFrmSoliComp2.CmeCadastroInsert(Sender: TObject);
begin
  If Modulo.bVeioAnalise Then;
     FrmSoliComp2.CmeCadastro.RepetirInsert := False;
  inherited;
  //

  Orcamentoback.IdReserva := 0;
  ReResOrc.Value          := 0;
  iNumSoliComp            := 0;
  SelecionaFilhos;
  //
  qry.fieldByName('IDPESSOA').asinteger       := Sistema.IdEmpresa;
  qry.fieldByName('IDEMPRESA').asinteger      := Sistema.IdEmpresa;
  qry.fieldByName('CODCENTROCUSTO').asstring  := Modulo.sCodCCusto;
  qry.fieldByName('SOLICIACEITA').asstring    := 'F';
  qry.fieldByName('SOLICIATENDIDA').asstring  := 'F';
  qry.fieldByName('IMPRESSO').asstring        := 'F';
  qry.FieldByName('CUSTOESTOQUE').AsString    := 'E';
  qry.FieldByName('DATAEMISSAO').AsString     := DateToStr(Date);
  qry.FieldByName('DATAENTREGA').AsString     := DateToStr(Date);

  qry.FieldByName('CODCENTRORESPON').AsString := cdsParamCompras.FieldByName
      ('CODCENTRORESPON').AsString;

  DbrgDestino.ReadOnly    := qryParamComprasOPDESTINO.AsString <> 'A';
  if DbrgDestino.ReadOnly then qry.FieldByName('CUSTOESTOQUE').AsString := qryParamComprasOPDESTINO.AsString;

  //
  dbdteEmissao.Date    :=Date;
  dbdteNecessidade.Date:=Date;
  //
  dbdteEmissao.SetFocus;
  sGrupoProd := '';
  sNumOC     := '';
end;




Function TFrmSoliComp2.CalculaValorTotal: Real;
Begin
  rValorTotal:= 0;
  If Not qryItemSoli.IsEmpty Then
  Begin
    qryItemSoli.DisableControls;
    qryItemSoli.First;
    While not qryItemSoli.Eof do
    Begin
      rValorTotal:= rValorTotal + qryItemSoli.FieldByName('ValorTotal').AsFloat;
      qryItemSoli.Next;
    end;
    qryItemSoli.EnableControls;
  end;
  Result:= rValorTotal;
  EdValorTotal.Value:= rValorTotal;
end;




procedure TFrmSoliComp2.FormCreate(Sender: TObject);
var
  cdsAlmoxaLocal: TClientDataSet;
begin
  inherited;

  RAD     := TCtrlRAd.Create;
  RADPlus := TCtrlRADPlus.Create;
  RADConsultaCompras := TCtrlRADConsultaCompras.Create;


  RAD.InitializeAs(Padroes);
  RAD.OpenTransaction := False;

  RADPlus.InitializeAs(Padroes);
  RADPlus.OpenTransaction := false;
  RADPlus.InitializeAs(Padroes);
  RADPlus.OpenTransaction := false;

  RADConsultaCompras.InitializeAs(Padroes);

  qryPlano.Open;
  qryPatro.Open;
  qryPrograma.Open;

  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(Padroes);


  CtrlAlmoxCompra := TCtrlAlmoxCompra.Create;
  CtrlAlmoxCompra.InitializeAs(Padroes);

  cdsParamCompras := TClientDataSet.Create(Self);

  cdsParamCompras.Data := CtrlAlmoxCompra.GetParamCompras(Sistema.IdEmpresa);

  cdsAlmoxaLocal      := TClientDataSet.Create(nil);
  cdsAlmoxaLocal.Data := CtrlAlmoxCompra.GetParalmox(Sistema.IdEmpresa);

  ImpostoRetido    := TImpostoRetido.Create;
  GpDotOrc.Enabled := (ParamIntegra.IntegraOrcamento);


  iIdTipoProcesso := -1;
  iGrauGrupo      := -1;
  FlgTestaGrau    := False;

  if (Sistema.UsaRad) then
  begin
    if (Sistema.VersaoRAD = '+') then
    begin
       iIdTipoProcesso := RAdPlus.RecuperaTipoProcesso(3, Sistema.idEmpresa);
       iGrauGrupo      := cdsAlmoxaLocal.FieldByName('GRAUGRUPPROD').AsInteger;
       FlgTestaGrau    := (cdsAlmoxaLocal.FieldByName('FLGTESTAGRAU').AsInteger > 0);
    end
    else
    begin
       If Fazquery(DtmBaseDados.qry,'SELECT IDTIPOPROCESSO,GRAUGRUPPROD FROM RADTIPOPROCESSO WHERE (IDREFERENCIA = 3)') Then
       begin
          iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
          iGrauGrupo      := DtmBaseDados.qry.FieldByName('GRAUGRUPPROD').asInteger;
       end;
    end;
  end;

  FreeAndNil(cdsAlmoxaLocal);

  //
  OrcamentoBack := TOrcamentoBack.Create;
  //
  If GpDotOrc.Enabled Then
     MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  //
  MontaSelect.Filtro.Add('SOLICOMP.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('CENTRESPON.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('UNIDNEGOCIO.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('SOLICOMP.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  //
  qryAlmoxaOrigem.Close;
  qryAlmoxaOrigem.ParamByName('CODALMOXARIFADO').asinteger:= Modulo.iCodAlmoxa;
  qryAlmoxaOrigem.ParamByName('idpessoa').asinteger:= Sistema.IdEmpresa;
  qryAlmoxaOrigem.open;
  //
  qryArtigo.Close;
  qryArtigo.ParamByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
  qryArtigo.ParamByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
  qryArtigo.Open;
  //
  iNumSoliComp:=0;
  FazerQryPrincipal;
  SelecionaFilhos;
  //
  qryCRespon.Close;
  qryCRespon.ParamByName('PIDPESS').asInteger   := Sistema.IdEmpresa;
  qryCRespon.ParamByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
  qryCRespon.Open;
  //
  montaselect.Filtro.add('SOLICOMP.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  qryUnid.Close;
  qryUnid.Sql.text := ' SELECT UNIDNEGOC,NOME FROM UNIDNEGOCIO ' +
                      ' WHERE IDPESSOA = '+ IntToStr(Sistema.IdEmpresa ) +
  //Vinicius Maciel - SOL 163982 - KTN 1404974
                      ' AND UNETIPO = '+QuotedStr('A')+' AND ATIVO = '+QuotedStr('S') +
  //Vinicius Maciel - SOL 163982 - KTN 1404974 - FIM
                      ' ORDER BY NOME ';
  qryUnid.Open;
  EdAlmoxaDestino.Text:= Modulo.sAlmoxaUsuario;
end;




procedure TFrmSoliComp2.dblkcmbCodArtigoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Var
   iAux      : LongInt;
   sDescProd : String;
begin
  inherited;
  If ( Sistema.idModulo = 6 ) And (Modulo.sTrasObs = '1' ) Then
     dbReObs.Text := QryArtigo.FieldByName('DESCRCOMPL').asString;
  iAux := -1;
  AtualizaComboUnidade(dblkcmbCodArtigo.LookupValue);
  dblkcmbDesc.LookupValue := dblkcmbCodArtigo.LookupValue;
  if QryArtigo.FieldByName('FLGVARIAVEL').asString = 'S' Then
     iAux := Modulo.ProdVari( sDescProd );
  If iAux > 0 Then
     Begin
         QryItemSoli.FieldByName('IDPRODVARI').AsInteger := iAux;
         QryItemSoli.FieldByName('DESCRICAO').AsString   := Copy(sDescProd,1,60);
     End
  Else
    Begin
       QryItemSoli.FieldByName('IDPRODVARI').Clear;
       QryItemSoli.FieldByName('DESCRICAO').AsString := dblkcmbDesc.Text;
    End;
  ViewContrato(dblkcmbCodArtigo.LookupValue);
end;




procedure TFrmSoliComp2.dblkcmbDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Var
   iAux      : LongInt;
   sDescProd : String;
begin
  inherited;
  If ( Sistema.idModulo = 6 ) And ( Modulo.sTrasObs = '1' ) Then dbReObs.Text := QryArtigo.FieldByName( 'DESCRCOMPL' ).asString;
  iAux := -1;
  AtualizaComboUnidade(dblkcmbCodArtigo.LookupValue);
  dblkcmbCodArtigo.LookupValue :=  dblkcmbDesc.LookupValue;
  if QryArtigo.FieldByName('FLGVARIAVEL').asString = 'S' Then
     iAux := Modulo.ProdVari( sDescProd );
  If iAux > 0 Then
     Begin
         QryItemSoli.FieldByName('IDPRODVARI').AsInteger := iAux;
         QryItemSoli.FieldByName('DESCRICAO').AsString   := Copy(sDescProd,1,60);
     End
  Else
    Begin
       QryItemSoli.FieldByName('IDPRODVARI').Clear;
       QryItemSoli.FieldByName('DESCRICAO').AsString := dblkcmbDesc.Text;
    End;
  ViewContrato(dblkcmbDesc.LookupValue);
end;




procedure TFrmSoliComp2.CmeCadastroFind(Sender: TObject);
begin
  If (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') Then
  Begin
     iNumSoliComp:=StrToInt(MontaSelect.ValoresChave[0]);
     FazerQryPrincipal;
     SelecionaFilhos;
     DbrgDestino.Value := qryParamComprasOPDESTINO.AsString;
     //Vinicius Maciel - SOL 163982 KTN 1404974
     if((dbLcAtiv.Text = '') and (dbLcAtiv.LookupValue <> '')) then
     dbLcAtiv.Text := CtrlAlmoxCompra.recuperaAtividadePerd(dbLcAtiv.LookupValue)
     //Vinicius Maciel - SOL 163982 KTN 1404974 - FIM
  end;
end;




procedure TFrmSoliComp2.bbtnOkDetClick(Sender: TObject);
begin

  inherited;

  dblkcmbCodArtigo.SetFocus;

end;




procedure TFrmSoliComp2.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CalculaValorTotal;
end;




procedure TFrmSoliComp2.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  CalculaValorTotal;
end;




procedure TFrmSoliComp2.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DbrgDestino.Value := qryParamComprasOPDESTINO.AsString;
  CalculaValorTotal;
end;




procedure TFrmSoliComp2.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  CalculaValorTotal;
end;




procedure TFrmSoliComp2.bbtnConfirmarClick(Sender: TObject);
begin
  If QryItemSoli.State = dsInsert Then bbtnVoltarDetClick(self);

  If trim(dblcCentRespon.Text ) = '' Then
     Begin
        MsgDlg('Centro de responsabilidade não foi preenchido','Erro',mtError,[mbOk],0);
        dblcCentRespon.SetFocus;
        Exit;
     End;
  If (GpDotOrc.Enabled) and (ReResOrc.Value = 0) Then
     Begin
        MsgDlg('Obrigatório indicar a reserva orçamentária','Erro',mtError,[mbOk],0);
        ReResOrc.SetFocus;
        Exit;
     End;
  If trim(dblcAtiv.Text ) = '' Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
        Exit;
     End;
  If trim(dbdteEmissao.Text) = '' Then
     Begin
        MsgDlg('Data de Emissão não foi Preenchida','Erro',mtError,[mbOk],0);
        dbdteEmissao.SetFocus;
        Exit;
     end;
  If trim(dbdteNEcessidade.Text) = '' Then
     Begin
        MsgDlg('Data de Necessidade não foi Preenchida','Erro',mtError,[mbOk],0);
        dbdteNEcessidade.SetFocus;
        Exit;
     end;
  If dbdteEmissao.Date > dbdteNecessidade.Date Then
     Begin
        MsgDlg('Data de Emissão não pode ser maior que a data de necessidae ','ERRO',mtError,[mbOk],0);
        dbdteEmissao.SetFocus;
        Exit;
     End;
  If qryItemSoli.IsEmpty  Then
    Begin
         MsgDlg('Não ha nenhum item preenchido','Erro',mtError,[mbOk],0);
         dbdteEmissao.SetFocus;
         Exit;
    End;
  //
  if qry.fieldByName('numSolCompra').asinteger <=0 then
     Begin
       qry.fieldByName('numSolCompra').asinteger:= LeUltRegistro(nil,'SOLICOMP');
     End;
  qryItemSoli.First;
  While not qryItemSoli.eof do
  Begin
    if OrcamentoBack.IdReserva <> 0 then
       Begin
          if not BuscaTipos(OrcamentoBack.IdReserva,QryItemSoli.FieldByName('CODARTIGO').AsString) then
             Begin
                MsgDlg('Artigo '+QryItemSoli.FieldByName('DESCRICAO').AsString+' não pode ser solicitado por esta reserva orçamentária','Erro',mtError,[mbOk],0);
                dblcCentRespon.SetFocus;
                Exit;
             end;
       end;
    qryItemSoli.Edit;
    If qryItemSoli.FieldByName('IDITEMSOLI').asInteger <= 0 Then
       qryItemSoli.FieldByName('IDITEMSOLI').asInteger :=  LeUltRegistro(nil,'ITEMSOLI');
    //
    qryItemSoli.fieldByName('NUMSOLCOMPRA').asinteger:= qry.fieldByName('NUMSOLCOMPRA').asinteger ;
    If qryItemSoli.FieldByName('IDFORNE').AsInteger <= 0 Then
       Begin
          if (QryItemSoli.FieldByName('QTDEPENDENTE').AsFloat <> 0) or (QryItemSoli.FieldByName('QTDEPENDENTE').IsNull) then
             qryItemSoli.fieldByName('QTDEPENDENTE').asFloat:= qryItemSoli.fieldByName('QTDEPEDIDA').asFloat;
          if (QryItemSoli.FieldByName('SALDOACOMPRAR').AsFloat <> 0) or (QryItemSoli.FieldByName('SALDOACOMPRAR').IsNull) then
             qryItemSoli.fieldByName('SALDOACOMPRAR').asFloat:= qryItemSoli.fieldByName('QTDEPEDIDA').asFloat;
       End
    Else
       Begin
          if (QryItemSoli.FieldByName('QTDEPENDENTE').AsFloat <> 0) or (QryItemSoli.FieldByName('QTDEPENDENTE').IsNull) then
            qryItemSoli.fieldByName('QTDEPENDENTE').asFloat:= qryItemSoli.fieldByName('QTDEPEDIDA').asFloat;
          if (QryItemSoli.FieldByName('SaldoaComprar').AsFloat <> 0) or (QryItemSoli.FieldByName('SaldoaComprar').IsNull) then
                         qryItemSoli.fieldByName('SALDOACOMPRAR').asFloat:= qryItemSoli.fieldByName('QTDEPEDIDA').asFloat;
       End;
    qryItemSoli.Post;
    qryItemSoli.Next;
  end;

  inherited;
end;




procedure TFrmSoliComp2.dblkcmbUnidadeCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
  var mascara : string;
      valorUn : Extended;
begin
  inherited;
  if dbcmbTipoValor.ItemIndex = 1 then
  begin
    valorUn := ValUnitUltCompra(dblkcmbCodArtigo.Text);
  end
  else begin
    valorUn:=ConvertCustoMed(qryValorUn,dblkcmbUnidade.text,Modulo.iCodAlmoxa ,
               dblkcmbCodArtigo.Text);
  end;
  if ValorUn<0.005 then
     mascara:='#,##0.00##'
  else
     mascara:='#,##0.00';
  TFloatField(qryItemSoli.fieldByName('ValorUn')).DisplayFormat:= mascara;
  qryItemSoli.fieldByName('ValorUn').AsFloat := ValorUn;
end;




procedure TFrmSoliComp2.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  qryItemSoli.FieldByName('IDFORNE').AsInteger  := -1;
  dblkcmbCodArtigo.SetFocus;
  qryItemSoli.FieldByName('IDPLANOPREV').AsInteger := qryParamAlmoxIDPLANOPREV.AsInteger;
  qryItemSoli.FieldByName('IDPATRO').AsInteger     := qryParamAlmoxIDPATRO.AsInteger;
  qryItemSoli.FieldByName('IDPROGRAMA').AsInteger  := qryParamAlmoxIDPROGRAMA.AsInteger;
end;




procedure TFrmSoliComp2.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  DbrgDestino.ReadOnly    := qryParamComprasOPDESTINO.AsString <> 'A';
  if DbrgDestino.ReadOnly then qry.FieldByName('CUSTOESTOQUE').AsString := qryParamComprasOPDESTINO.AsString;

  If VerifCotacao(qry.FieldByName('NUMSOLCOMPRA').AsInteger) Then
     Begin
        MsgDlg('Esta solicitação já possui itens atribuidos para compra.E proibido altera-lá ','Erro',mtError,[mbOk],0);
        bbtnCancelar.click;
        Exit;
     End;
  dbdteEmissao.Date     := qry.FieldByName('DATAEMISSAO').AsDateTime;
  dbdteNecessidade.Date := qry.FieldByName('DATAENTREGA').AsDateTime;
  dbdteEmissao.SetFocus;
  If (qry.FieldByName('IdReservaOrcamen').AsInteger <> 0) Then
     Begin
        ReResOrc.Value             := OrcamentoBack.BuscaIdNumReserva(qry.FieldByName('IdReservaOrcamen').AsInteger,0,True);
        OrcamentoBack.NumReserva   := Trunc(ReResOrc.Value);
        Orcamentoback.IdReserva    := qry.FieldByName('IdReservaOrcamen').AsInteger;
        Try
           StartTransacao;
           If OrcamentoBack.EstornaReserva(OrcamentoBack.NumReserva,True) <> 0 Then
              Abort;
           CommitTransacao;
        Except
           RollBackTransacao;
           Raise;
        End;
     End
  Else
     Begin
        ReResOrc.Value := 0;
        OrcamentoBack.NumReserva   := 0;
        Orcamentoback.IdReserva    := 0;
     End;
 QryItemSoli.First;
 sGrupoProd := Modulo.LeGrupoProd(QryItemSoli.FieldByName('CODARTIGO').asString);
end;




procedure TFrmSoliComp2.FazerQryPrincipal;
begin
  Qry.Close;
  Qry.Sql.Clear;
  Qry.SQl.Text:=' Select S.*, A.DescAlmox, '+
                ' A.CodAlmoxarifado As CodAlmoxaDest, '+
                ' A.CodCusteio As CodCusteioDest '+
                ' From SoliComp S,Almox A '+
                ' Where S.NumSolCompra = '+ IntToStr(iNumSoliComp) +
                ' and S.CodAlmoxarifado=A.CodAlmoxarifado(+) ';
  Qry.Open;
  if qry.FieldByName('IDRESERVAORCAMEN').AsInteger > 0 then
     Begin
        ReResOrc.Value:=OrcamentoBack.BuscaIdNumReserva(qry.FieldByName('IDRESERVAORCAMEN').AsInteger,0,True);
        OrcamentoBack.NumReserva   := Trunc(ReResOrc.Value);
        Orcamentoback.IdReserva    := qry.FieldByName('IdReservaOrcamen').AsInteger;
     End
  else
     Begin
        ReResOrc.Value           := 0;
        OrcamentoBack.NumReserva := 0;
        Orcamentoback.IdReserva  := 0;
     End;

end;




Procedure TFrmSoliComp2.CmeDetalheEdit(Sender: TObject);
Begin
   inherited;
   if qry.State = dsEdit then
   Begin
      if Format('%17.2f',[QryItemSoli.FieldByName('SALDOACOMPRAR').AsFloat]) <> Format('%17.2f',[QryItemSoli.FieldByName('QTDEPEDIDA').AsFloat]) then
      Begin
         MsgDlg('Proibido Alterar, item já foi comprado.','Erro',mtError,[mbOk],0);
         bbtnCancelarDetClick(Self);
         exit;
      end;
   end;
end;




Procedure TFrmSoliComp2.CmeDetalheDelete(Sender: TObject);
Begin
   if (not QryItemSoli.FieldByName('SALDOACOMPRAR').isnull) and (Format('%17.2f',[QryItemSoli.FieldByName('SALDOACOMPRAR').AsFloat]) <> Format('%17.2f',[QryItemSoli.FieldByName('QTDEPEDIDA').AsFloat])) then
   Begin
      QryItemSoli.Edit;
      QryItemSoli.FieldByName('QTDEPENDENTE').AsFloat:=0;
      QryItemSoli.FieldByName('SALDOACOMPRAR').AsFloat:=0;
      QryItemSoli.Post;
      bbtnOkDetClick(Self);
   end
   Else
   If ExistProcesso(qry.FieldByName('NumSolCompra').AsInteger,qryItemSoli.FieldByName('IDITEMSOLI').AsInteger) Then
     Begin
        MsgDlg('Este item está em processo de compra. Não pode ser excluido','Erro',mtError,[mbOk],0);
     End
   Else
      Begin
         inherited;
         If QryItemSoli.IsEmpty Then
            sGrupoProd := '';
      End;
end;




procedure TFrmSoliComp2.SelecionaFilhos;
begin
  QryItemSoli.Close;
  QryItemSoli.Sql.Clear;
  QryItemSoli.Sql.Add(' SELECT I.*, ');
  {Alteração feita para mostrar no grid o nome da patro, do plano e do programa}
  QryItemSoli.Sql.Add('   PT.NOME AS NOMEPATRO, PP.NOME AS NOMEPLANO, P.DESCPROGRAMA, ');

  QryItemSoli.Sql.Add(' SUBSTR(DECODE(PV.IDPRODVARI,NULL,( P.DESCPROD  || '' '' || A.CODCOR || '' '' ||  A.CODTAMANHO ),PV.DESCPRODVARI),1,60) AS DESCRICAO,');
  QryItemSoli.Sql.Add(' P.CODMEDCUSTO,P.CODPRODUTO, CO.FATOR,CF.FATOR, ');
  QryItemSoli.Sql.Add(' (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) AS VALORUN, ');
  QryItemSoli.Sql.Add(' (C.CUSTOMEDIO*CF.FATOR/CO.FATOR) * I.QTDEPEDIDA AS VALORTOTAL, ');
  QryItemSoli.Sql.Add(' (-1) AS IDFORNE,  ');
  QryItemSoli.Sql.Add(' (0)  AS VALORUN,  ');
  QryItemSoli.Sql.Add(' (0)  AS PRAZOPAG  ');
  QryItemSoli.Sql.Add(' FROM ITEMSOLI I, ARTIGO A, PRODUTO P, CUSTOMED C,');
  QryItemSoli.Sql.Add(' CONVER CO, CONVER CF, PRODVARI PV ');

  {Alteração feita para mostrar no grid o nome da patro, do plano e do programa}
  QryItemSoli.Sql.Add(', PROGRAMA P, PLANPREVCONTABIL PP, PESSOA PT ');

  QryItemSoli.Sql.Add(' WHERE (I.NUMSOLCOMPRA = '+ INTTOSTR(iNumSoliComp) +')');
  QryItemSoli.Sql.Add(' AND (I.CODARTIGO      = A.CODARTIGO)    ');
  QryItemSoli.Sql.Add(' AND (A.CODPRODUTO     = P.CODPRODUTO)  ');
  QryItemSoli.Sql.Add(' AND (A.CODARTIGO      = C.CODARTIGO(+)) ');
  QryItemSoli.Sql.Add(' AND (C.CODCUSTEIO(+)  = '+ IntToStr(Modulo.iCodCusteio) +') ');
  QryItemSoli.Sql.Add(' AND (P.CodProduto     = CO.CodProduto)  ');
  QryItemSoli.Sql.Add(' AND (CO.CodMedida     = P.CODMEDCUSTO)  ');
  QryItemSoli.Sql.Add(' AND (P.CodProduto     = CF.CodProduto)  ');
  QryItemSoli.Sql.Add(' AND (CF.CodMedida     = I.CODMEDIDA)    ');
  QryItemSoli.Sql.Add(' AND (PV.IDPRODVARI(+) = I.IDPRODVARI) ');

  {Alteração feita para mostrar no grid o nome da patro, do plano e do programa}
  QryItemSoli.Sql.Add(' AND (I.IDPROGRAMA     = P.IDPROGRAMA) ');
  QryItemSoli.Sql.Add(' AND (I.IDPLANOPREV    = PP.IDPLANOPREV) ');
  QryItemSoli.Sql.Add(' AND (I.IDPATRO        = PT.IDPESSOA) ');

  QryItemSoli.Sql.Add(' ORDER BY A.CODARTIGO,P.DESCPROD     ');
  QryItemSoli.Open;
  TFloatField(QryItemSoli.FieldByName('ValorUn')).DisplayFormat    := '#,##0.00';
  TFloatField(QryItemSoli.FieldByName('ValorTotal')).DisplayFormat := '#,##0.00';
  CalculaValorTotal;
end;




Function TFrmSoliComp2.ExistProcesso( n, iIdItemSoli : LongInt ) : Boolean;
Begin
    //
    Result := False;
    If iIdItemSoli <= 0 Then
       Begin
           If FazQuery(DtmBaseDados.qry,' SELECT NUMSOLCOMPRA '+
                                        ' FROM ITEMSOLI '+
                                        ' WHERE '+
                                        '      (CODPROCESSO IS NOT NULL)'+
                                        '  AND (NUMSOLCOMPRA = ' +IntToStr(n)+' )')
           Then
              Result := Not DtmBaseDados.qry.isEmpty;
       End
    Else
       Begin
           If FazQuery(DtmBaseDados.qry,' SELECT NUMSOLCOMPRA '+
                                        ' FROM ITEMSOLI '+
                                        ' WHERE '+
                                        '      (IDITEMSOLI = '+IntToStr(iIdItemSoli)+')'+
                                        '  AND (CODPROCESSO IS NOT NULL)')
           Then
              Result := Not DtmBaseDados.qry.isEmpty;
       End
End;




procedure TFrmSoliComp2.btnOrcamentoClick(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  If  MsResORc.RetornouValor Then
     Begin
        ReResOrc.Value := StrToInt(MsResORc.ValoresChave[1]);
        ReResOrc.Text  := MsResORc.ValoresChave[1];
        OrcamentoBack.IdReserva := StrToInt(MsResORc.ValoresChave[0]);
     End;
end;




procedure TFrmSoliComp2.CmeCadastroCancel(Sender: TObject);
Begin
   If (qry.FieldByName('IdReservaOrcamen').AsInteger <> 0) and ( qry.State = dsEdit) Then
      Begin
         ReResOrc.Value := OrcamentoBack.BuscaIdNumReserva(qry.FieldByName('IdReservaOrcamen').AsInteger,0,True);
         OrcamentoBack.NumReserva   := Trunc(ReResOrc.Value);
         Orcamentoback.IdReserva    := qry.FieldByName('IdReservaOrcamen').AsInteger;
         Try
            StartTransacao;
            If OrcamentoBack.MarcaReserva(OrcamentoBack.NumReserva,True) <> 0 Then
            begin
              inherited;
              Abort;
            end;  
            CommitTransacao;
         Except
            RollBackTransacao;
            Raise;
         End;
      End;
     inherited;
End;




procedure TFrmSoliComp2.ReResOrcExit(Sender: TObject);
Var
  iValorRetorno: Integer;
begin
  inherited;
  If (ActiveControl.tag <> 9999) And (ReResOrc.Value > 0) Then
  Begin
     iValorRetorno := OrcamentoBack.BuscaIdNumReserva(0,Trunc(ReResOrc.Value),True);
     If iValorRetorno > 0 Then
        OrcamentoBack.IdReserva := iValorRetorno
     Else
     Begin
        ReResOrc.Value := 0;
        If ReResOrc.CanFocus Then ReResOrc.SetFocus;
     End;
  End
  Else
    If (ReResOrc.Value <= 0) Then
       Orcamentoback.IdReserva := 0;
end;

procedure TFrmSoliComp2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlPlanPrevContabPatro.Free;
   FreeAndNil(CtrlAlmoxCompra);
   qryParamCompras.Close;
   ImpostoRetido.Free;
   OrcamentoBack.Free;

   FreeAndNil(RAD);
   FreeAndNil(RADPlus);
   FreeAndNil(RADConsultaCompras);

   inherited;
end;




function TFrmSoliComp2.BuscaTipos(idReserva : LongInt; sCodArt:String) : Boolean;
var sSql:String;
Begin
   Result := False;
   sSql:=' SELECT C.CODTIPRECDES, C.RECPAG '+
         ' FROM COMPCONTASORCAMEN C, RESERVAORCAMEN R, GRUPPROD G, PRODUTO P '+
         ' WHERE (R.IDRESERVAORCAMEN = '+IntToStr(idReserva)+') AND '+
         '       (R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND '+
         '       (R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND '+
         '       (C.CODTIPRECDES   = G.CODTIPRECDES)   AND '+
         '       (C.RECPAG         = G.RECPAG)         AND '+
         '       (C.IDPESSOA       = G.IDPESSOA)       AND '+
         '       (G.CODGRUPOPROD   = P.CODGRUPOPROD)   AND '+
         '       (RTRIM(P.CODPRODUTO) = '''+Trim(Copy(sCodArt,1,6))+''')';
   if FazQuery(DtmBaseDados.qry,sSql) then
      Result := True;
end;




Procedure TFrmSoliComp2.ViewContrato( sCodArt : String );
Begin
    qryContrato.Close;
    qryContrato.ParamByName('pCODART').asString := Espaco(Trim(sCodArt),14);
    qryContrato.Open;
    If Not qryContrato.IsEmpty Then
      Begin
         Application.CreateForm(TFrmViewContrato,FrmViewContrato);
         FrmViewContrato.plnTitulo.Caption := ' Artigo : '+sCodArt+ '   -   '+dblkcmbDesc.Text;
         If FrmViewContrato.ShowModal = mrOk Then
            Begin
                With qryContrato Do
                   Begin
                       QryItemSoli.FieldByName('IDCONTRATOPROD').asFloat := FieldByName('IDCONTRATOPROD').asFloat;
                       QryItemSoli.FieldByName('VALORUN').asFloat        := FieldByName('VLRUNITARIO').asFloat;
                       QryItemSoli.FieldByName('CODMEDIDA').asString     := FieldByName('CODMEDIDA').asString;
                       QryItemSoli.FieldByName('QTDEPEDIDA').asFloat     := FieldByName('QTDEESPERADA').asFloat;
                       qryItemSoli.FieldByName('IDFORNE').AsInteger      := FieldByName('IDFORCLI').asInteger;
                       qryItemSoli.FieldByName('PRAZOPAG').AsInteger     := FieldByName('PRAZOPAG').asInteger;
                       qryItemSoli.FieldByName('IDCOMPRADOR').AsInteger  := FieldByName('IDCOMPRADOR').asInteger;
                       dbedValorUn.Value                                 := FieldByName('VLRUNITARIO').asFloat;
                   End;
            End;
      End;
End;




Function TFrmSoliComp2.GeraOC : Boolean;
Var
   VetForn  : Array[1..100] Of TVetForn;
   AuxForn  : TVetForn;
   x,y      : Integer;
   Max      : Integer;
   sSql     : String;
   iNumOC   : LongInt;
   AuxForne : LongInt;
   cAux     : Char;
   iPrazo   : Integer;
   iItemOC  : LongInt;
Begin
   Result := True;
   Max    := 0;
   qryItemSoli.First;
   While Not qryItemSoli.Eof Do
     Begin
        if qryItemSoli.FieldByName('IDFORNE').AsInteger > 0 Then
           Begin
               Inc( Max );
               VetForn[Max].IdForn       := qryItemSoli.FieldByName('IDFORNE').AsInteger;
               VetForn[Max].CodArtigo    := qryItemSoli.FieldByName('CODARTIGO').AsString;
               VetForn[Max].IdProdVari   := qryItemSoli.FieldByName('IDPRODVARI').AsInteger;
               VetForn[Max].IdItemSoli   := qryItemSoli.FieldByName('IDITEMSOLI').AsInteger;
               VetForn[Max].CodMedida    := qryItemSoli.FieldByName('CODMEDIDA').AsString;
               VetForn[Max].Qtde         := qryItemSoli.FieldByName('QTDEPEDIDA').AsInteger;
               VetForn[Max].ValorUn      := qryItemSoli.FieldByName('VALORUN').AsFloat;
               VetForn[Max].PrazoPag     := qryItemSoli.FieldByName('PRAZOPAG').AsInteger;
               VetForn[Max].Obs          := qryItemSoli.FieldByName('OBSITEMSOLIC').AsString;
               VetForn[Max].CodImposto   := -1;
               VetForn[Max].Aliquota     := 0;
               VetForn[Max].BaseCalc     := 0;
               VetForn[Max].ValorAgreg   := 0;
               VetForn[Max].CodtipRecDes := Modulo.LeCodTipRecDes(Modulo.LeGrupoProd(qryItemSoli.FieldByName('CODARTIGO').AsString));
           End;
        qryItemSoli.Next;
     End;
//----------------------------------------------------------------------------------------
// Ordenação do Vetor
//----------------------------------------------------------------------------------------
      For x := 1 To Max Do
        For y := x + 1 To Max - 1 Do
          Begin
               if VetForn[x].IdForn > VetForn[y].IdForn Then
                  Begin
                      AuxForn.IdForn       := VetForn[x].IdForn;
                      AuxForn.CodArtigo    := VetForn[x].CodArtigo;
                      AuxForn.IdProdVari   := VetForn[x].IdProdVari;
                      AuxForn.IdItemSoli   := VetForn[x].IdItemSoli;
                      AuxForn.CodMedida    := VetForn[x].CodMedida;
                      AuxForn.Qtde         := VetForn[x].Qtde;
                      AuxForn.ValorUn      := VetForn[x].ValorUn;
                      AuxForn.CodImposto   := VetForn[x].CodImposto;
                      AuxForn.Aliquota     := VetForn[x].Aliquota;
                      AuxForn.BaseCalc     := VetForn[x].BaseCalc;
                      AuxForn.ValorAgreg   := VetForn[x].ValorAgreg;
                      AuxForn.CodtipRecDes := VetForn[x].CodtipRecDes;
                      //
                      VetForn[x].IdForn       := VetForn[y].IdForn;
                      VetForn[x].CodArtigo    := VetForn[y].CodArtigo;
                      VetForn[x].IdProdVari   := VetForn[y].IdProdVari;
                      VetForn[x].IdItemSoli   := VetForn[y].IdItemSoli;
                      VetForn[x].CodMedida    := VetForn[y].CodMedida;
                      VetForn[x].Qtde         := VetForn[y].Qtde;
                      VetForn[x].ValorUn      := VetForn[y].ValorUn;
                      VetForn[x].CodImposto   := VetForn[y].CodImposto;
                      VetForn[x].Aliquota     := VetForn[y].Aliquota;
                      VetForn[x].BaseCalc     := VetForn[y].BaseCalc;
                      VetForn[x].ValorAgreg   := VetForn[y].ValorAgreg;
                      VetForn[x].CodtipRecDes := VetForn[y].CodtipRecDes;
                      //
                      VetForn[y].IdForn       := AuxForn.IdForn;
                      VetForn[y].CodArtigo    := AuxForn.CodArtigo;
                      VetForn[y].IdProdVari   := AuxForn.IdProdVari;
                      VetForn[y].IdItemSoli   := AuxForn.IdItemSoli;
                      VetForn[y].CodMedida    := AuxForn.CodMedida;
                      VetForn[y].Qtde         := AuxForn.Qtde;
                      VetForn[y].ValorUn      := AuxForn.ValorUn;
                      VetForn[y].CodImposto   := AuxForn.CodImposto;
                      VetForn[y].Aliquota     := AuxForn.Aliquota;
                      VetForn[y].BaseCalc     := AuxForn.BaseCalc;
                      VetForn[y].ValorAgreg   := AuxForn.ValorAgreg;
                      VetForn[y].CodtipRecDes := AuxForn.CodtipRecDes;
                  End;
          End;
//----------------------------------------------------------------------------------------
// Processamento Gerando a O.C.
//----------------------------------------------------------------------------------------
   AuxForne := -1;
   iNumOC   := -1;
   x        := 1;
   cAux             := DecimalSeparator;
   DecimalSeparator := '.';
   Try
      While x <= Max Do
         Begin
            // Gera a O.C. para cada Fornecedor
            If VetForn[x].IdForn <> AuxForne Then
               Begin
                  AuxForne := VetForn[x].IdForn;
                  iNumOC   := LeUltRegistro(nil,'OC');
                  sSql := 'INSERT INTO OC (NUMOC,IDFORCLI,IDPESSOA,OCATENDIDA,FLGIMPRESSA,DATAOC,FLGCOMSEMCOT) '+
                          'VALUES ('+IntToStr(iNumOC)+','+IntToStr(AuxForne)+','+IntToStr(Sistema.IdEmpresa)+','+
                          '''F'',''F'',TO_DATE('''+DateToStr(dbdteEmissao.Date)+''',''DD/MM/YYYY''),''S'') ';
                  If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
                     Abort;
               End;
            // Gera os Itens da O.C.
            iItemOC:=LeUltRegistro(nil,'ITEMOC');
            sSql:='INSERT INTO ITEMOC (IDITEMOC,NUMOC,CODARTIGO,CODMEDIDA,QTDEPEDIDA,QTDERECEBIDA,VALORUN,FLGITEMATENDIDO,OBSITEMOC,IDPRODVARI) '+
                  'VALUES ('+IntToStr(iItemOC)+','+IntToStr(iNumOC)+','''+vetForn[x].CodArtigo+''','+''''+vetForn[x].CodMedida+''','+
                  FormatFloat('#0.00000',VetForn[x].Qtde)+',0,'+FormatFloat('#0.00000',VetForn[x].ValorUn) +',''F'','''+VetForn[x].Obs+'''';
            If VetForn[x].IdProdVari <> 0 Then
               sSql:=sSql+','+IntToStr(VetForn[x].IdProdVari)+')'
            else
               sSql:=sSql+',NULL)';
            If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
               Abort;

            sSql:='INSERT INTO SCITEMOC (IDITEMSOLI,NUMSOLCOMPRA,IDITEMOC) '+
                  'VALUES ('+IntToStr(vetForn[x].IdItemSoli)+','+IntToStr(iNumSoliComp)+','+IntToStr(iItemOC)+')';
            If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
              Abort;

            iPrazo := StrToInt( FloatToStr(dbdteEmissao.Date - dbdteEmissao.Date) );
            If iPrazo <= 0 Then iPrazo := 1;

            sSql:='INSERT INTO PRAZOENTREGAOC (IDITEMOC,PARCELAENTREGA,PRAZOENTREGA,QTDEENTREGA,PERIODOPRAZO,DATAENTREGA)'+
                  'VALUES ('+IntToStr(iItemOC)+',1,'+IntToStr(iPrazo)+','+FormatFloat('#0.00000',VetForn[x].Qtde)+',''D'',TO_DATE('''+DateToStr(dbdteEmissao.Date)+''',''DD/MM/YYYY'') )';
            If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
               Abort;

            sSql:='INSERT INTO PRAZOPGTOOC (IDITEMOC,PARCELAPGTO ,PRAZOPGTO,PERIODOPRAZO,PERCPAGTO,DATAPAGTO)'+
                  'VALUES ('+IntToStr(iItemOC)+',1,'+IntToStr(VetForn[x].PrazoPag)+',''D'',100,TO_DATE('''+DateToStr(dbdteEmissao.Date + VetForn[x].PrazoPag)+''',''DD/MM/YYYY'') )';
            If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
               Abort;

            // AGREGITEMOC
            If Trim(VetForn[x].CodtipRecDes) <> '' Then
                Begin
                    //Gravar impostos vinculados ao fornecedor, tipo de desembolso e Classificacao Fiscal
                    ImpostoRetido.DataProgramada    := dbdteNecessidade.Date + VetForn[x].PrazoPag;
                    ImpostoRetido.OperacaoDocumento := '2 ';
                    ImpostoRetido.IdForCli          := VetForn[x].IdForn;
                    ImpostoRetido.CodDocumento      := 0;
                    ImpostoRetido.NumLancto         := 0;
                    ImpostoRetido.ValorLancto       := VetForn[x].Qtde * VetForn[x].ValorUn;
                    ImpostoRetido.ValorLiquido      := ImpostoRetido.ValorLancto;
                    ImpostoRetido.DataLancto        := dbdteEmissao.Date;
                    ImpostoRetido.DataEmissao       := dbdteEmissao.Date;
                    ImpostoRetido.DebCre            := 'C';
                    ImpostoRetido.CodTipRecDes      := VetForn[x].CodtipRecDes;
                    ImpostoRetido.MomentoLancamento := mlLancamento;
                    ImpostoRetido.CodTipoDoc        := StrToInt(Modulo.sCodTipoDoc);
                    ImpostoRetido.Incluir;
                    //
                    If Not ImpostoRetido.QrySimulacao.IsEmpty Then
                       Begin
                          ImpostoRetido.QrySimulacao.First;
                          While Not ImpostoRetido.QrySimulacao.EOF Do
                             Begin
                                sSql:='INSERT INTO AGREGITEMOC (IDAGREGITEMOC,CODTIPOCUSTAGREG,IDITEMOC,ALIQUOTA, BASECALCULO, VLRAGREGITEM)'+
                                      'VALUES ('+IntToStr(LeUltRegistro(nil,'AGREGITEMOC'))+','+
                                       IntToStr(ImpostoRetido.QrySimulacao.FieldByName('IDIMPOSTO').AsInteger)+','+
                                       IntToStr(iItemOC)+','+
                                       FormatFloat('#0.00',ImpostoRetido.QrySimulacao.FieldByName('PERCIMPOSTO').AsFloat) +','+
                                       FormatFloat('#0.00',ImpostoRetido.QrySimulacao.FieldByName('VALORBASE').AsFloat)   +','+
                                       FormatFloat('#0.00',ImpostoRetido.QrySimulacao.FieldByName('VALORIMPOSTO').AsFloat)+')';
                                If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
                                   Abort;
                                ImpostoRetido.QrySimulacao.Next;
                             End;
                       End;
                End;
            qryForn.Close;
            qryForn.ParamByName('IDPESSOA').asFloat := VetForn[x].IdForn;
            qryForn.Open;
            //
            qryAgregProd.Close;
            qryAgregProd.ParamByName('CODPRODUTO').asString := Trim(VetForn[x].CodArtigo);
            qryAgregProd.ParamByName('IDPESSOA').asInteger  := Sistema.IdEmpresa;
            qryAgregProd.Open;
            qryAgregProd.First;
            While Not qryAgregProd.Eof Do
               Begin
                   CalcImposto( Trim(VetForn[x].CodArtigo),
                                       qryFornCODESTADO.AsString,
                                       qryFornIDPAIS.AsInteger,
                                       qryAgregProdCODTIPOCUSTAGREG.asInteger,
                                       (VetForn[x].Qtde * VetForn[x].ValorUn),
                                       VetForn[x].BaseCalc,
                                       VetForn[x].Aliquota,
                                       VetForn[x].ValorAgreg);
                   //
                   sSql:='INSERT INTO AGREGITEMOC (IDAGREGITEMOC,CODTIPOCUSTAGREG,IDITEMOC,ALIQUOTA, BASECALCULO, VLRAGREGITEM)'+
                         'VALUES ('+IntToStr(LeUltRegistro(nil,'AGREGITEMOC'))+','+
                          IntToStr(qryAgregProdCODTIPOCUSTAGREG.asInteger)+','+
                          IntToStr(iItemOC)+','+
                          FormatFloat('#0.00',VetForn[x].Aliquota)  +','+
                          FormatFloat('#0.00',VetForn[x].BaseCalc)  +','+
                          FormatFloat('#0.00',VetForn[x].ValorAgreg)+')';
                   If Not ExecutarQuery(DtmBaseDados.qry,sSql) Then
                      Abort;
                   qryAgregProd.Next;
               End;
            Inc( x );
         //====================================================================
         // Visualização do Nº da O.C.
         //====================================================================
            If Trim(sNumOC) = '' Then
               sNumOC := sNumOC  + IntToStr(iNumOC)
            Else
               sNumOC := sNumOC  + ', '+ IntToStr(iNumOC);
         End;
   Except
       Raise;
       Result := False;
   End;
       DecimalSeparator := cAux;
End;




procedure TFrmSoliComp2.FormShow(Sender: TObject);
begin
  inherited;
  If Sistema.IdRAD <> 0 Then
     Begin
       If FazQuery(DtmBaseDados.qry,'SELECT NUMSOLCOMPRA FROM SOLICOMP WHERE(IDPROCESSO ='+IntToStr(Sistema.idRad)+')')
        Then
           Begin
              iNumSoliComp := DtmBaseDados.qry.FieldByName('NUMSOLCOMPRA').asInteger;
              Toolbar971.Visible := False;
              FazerQryPrincipal;
              SelecionaFilhos;
           End;
     End;
  qryParamCompras.Open;
  qryParamAlmox.Open;
end;




function TFrmSoliComp2.VerifCotacao(n: int64): Boolean;
Var
   SQL : String;
begin
  Result := False;
  SQL := ' SELECT SUM(NVL(IDCOMPRADOR,0)) AS IDCOMPRADOR  FROM ITEMSOLI WHERE (NUMSOLCOMPRA = '+IntToStr(n)+') ';
  If FazQuery(DtmBaseDados.qry,SQL) Then
     Result := DtmBaseDados.qry.FieldByName('IDCOMPRADOR').AsInteger > 0;
end;




procedure TFrmSoliComp2.BitBtn1Click(Sender: TObject);
begin
  inherited;
  twObs.Hide;
end;




procedure TFrmSoliComp2.dbgrdDetDblClick(Sender: TObject);
begin
  //inherited;
  twObs.Show;
end;




function TFrmSoliComp2.VerifSCIJaCotacao(N: Double): Boolean;
Var
   SQL : String;
begin
  Result := False;
  SQL := ' SELECT NUMSOLCOMPRA  FROM SCITEMOC WHERE (NUMSOLCOMPRA = '+FloatToStr(n)+') ';
  If FazQuery(DtmBaseDados.qry,SQL) Then
     Result := True;
end;




procedure TFrmSoliComp2.CalcImposto(sCODPRODUTO, sCODUF: String; iIDPAIS,
  iCODTIPOCUSTAGREG: Integer; rValorItem: Double; var rBase, rPerc,
  rValorImp: Double);
begin
   With DtmBaseDados.qry Do
     Begin
         Close;
         Sql.Text := ' SELECT PERCIMPOSTO,PERCBASEIMP '+
                     ' FROM IMPOSTOSXPRODUTOS '+
                     ' WHERE '+
                     '      (RTRIM(CODPRODUTO) = '''+ sCODPRODUTO +''') '+
                     '  AND (CODTIPOCUSTAGREG = '+ IntToStr(iCODTIPOCUSTAGREG) +') '+
                     '  AND (CODESTADO  = '''+ sCODUF +''') '+
                     '  AND (IDPAIS     = '''+ IntToStr(iIDPAIS) +''') ';
         Open;
     End;
  If Not DtmBaseDados.qry.IsEmpty Then
     Begin
        rBase := DtmBaseDados.qry.FieldByName('PERCBASEIMP').asFloat;
        rPerc := DtmBaseDados.qry.FieldByName('PERCIMPOSTO').asFloat;
        //
        rBase     := rValorItem*(rBase/100);
        rValorImp := rBase*(rPerc/100);
     End
  Else
     Begin
        rBase     := 0;
        rPerc     := 0;
        rValorImp := 0;
     End;
end;




function TFrmSoliComp2.ValUnitUltCompra(codArtigo: string): Extended;
var Artigo : tCtrlArtigo;
begin
  result := 0;
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  cdsValUnit.data := Artigo.ListUltCompra(codArtigo);
  result :=  cdsValUnit.FieldByName('VLRUNITARIO').asFloat;
  Artigo.free;
end;


procedure TFrmSoliComp2.dbcmbTipoValorCloseUp(Sender: TwwDBComboBox; Select: Boolean);
  var mascara : string;
      valorUn : Extended;
begin
  inherited;
  if dbcmbTipoValor.ItemIndex = 1 then
  begin
    valorUn := ValUnitUltCompra(dblkcmbCodArtigo.Text);
  end
  else begin
    valorUn:=ConvertCustoMed(qryValorUn,dblkcmbUnidade.text,Modulo.iCodAlmoxa ,
               dblkcmbCodArtigo.Text);
  end;
  if ValorUn<0.005 then
     mascara:='#,##0.00##'
  else
     mascara:='#,##0.00';
  TFloatField(qryItemSoli.fieldByName('ValorUn')).DisplayFormat:= mascara;
  qryItemSoli.fieldByName('ValorUn').AsFloat := ValorUn;
end;

procedure TFrmSoliComp2.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (cdsParamCompras.FieldByName('FLGDATAEMISSAO').AsString = '1') then
  begin
     if (CtrlAlmoxCompra.DataEmissaoMenorQueAtual(ds.DataSet.FieldByName('DATAEMISSAO').AsDateTime)) then
     begin
        MsgDlg('Data de emissão não pode ser menor que a data atual','Erro',mtError,[mbOk],0);
        Accept := False;
     end;
  end;
end;

end.

