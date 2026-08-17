unit FMTCotacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, Mask, DBCtrls, TREdit,
  DBCGrids, uCtrlCotacao,uCtrlArtigo,uCtrlMoeda,uCtrlUnMedida,
  uCtrlTipoAgregado, DBTables, Wwquery, uCMTypes, FrAgregados;
Type
   TPrazoEnt = Class(TObject)
   public
       QTDEENT       : Double;
       CODMEDIDA     : String;
       PERIODOPRAZO  : String;
       PRAZOENT      : Double;
       DATAENT       : TDateTime;
   End;
   TPrazoPag = Class(TObject)
   public
       PRAZOPGTO     : Double;        
       PERIODOPRAZO  : String;
       DATAPGTO      : TDateTime;
       PERCENT       : Double;
End;
type
  TFrmMTCotacao = class(TFrmCadastroMestreDetMT)
    plnArt: TPanel;
    Splitter1: TSplitter;
    GrdUltComp: TwwDBGrid;
    GrdArt: TwwDBGrid;
    Panel3: TPanel;
    Panel4: TPanel;
    TabPrecos: TTabSheet;
    TabPrazoPgto: TTabSheet;
    Panel1: TPanel;
    grdPrazoPgto: TwwDBGrid;
    TabObs: TTabSheet;
    DBCtrlGrid1: TDBCtrlGrid;
    dbObsSCI: TDBMemo;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edQtdePedida: TDBRealEdit;
    edUnid: TDBEdit;
    GrpForn: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    edQtdeForn: TDBRealEdit;
    dblcUN: TwwDBLookupCombo;
    Label7: TLabel;
    edPreco: TDBRealEdit;
    Label9: TLabel;
    edRef: TDBRealEdit;
    Label10: TLabel;
    edDataCot: TCMDateTimePicker;
    Label29: TLabel;
    edContato: TDBEdit;
    memOBS: TDBMemo;
    Label13: TLabel;
    Label12: TLabel;
    dblcMoeda: TCMDBLookupCombo;
    Label11: TLabel;
    edTxJuros: TDBEdit;
    TabAgregados: TTabSheet;
    cdsPrazoEntrega: TCMClientDataSet;
    cdsPrazoPgto: TCMClientDataSet;
    cdsAgregados: TCMClientDataSet;
    cdsUltCompra: TCMClientDataSet;
    cdsUnMedida: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    cdsFornecedor: TCMClientDataSet;
    cdsObs: TCMClientDataSet;
    Label1: TLabel;
    dblcForn: TCMDBLookupCombo;
    dsPrazoPgto: TwwDataSource;
    dsPrazoEntrega: TwwDataSource;
    Label22: TLabel;
    edPercentPag: TDBRealEdit;
    Label20: TLabel;
    edPrazoPag: TDBRealEdit;
    Label21: TLabel;
    Label19: TLabel;
    edDataPag: TCMDateTimePicker;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edDataEnt: TCMDateTimePicker;
    edPrazoEnt: TDBRealEdit;
    edUnEnt: TDBEdit;
    edQtdeEnt: TDBEdit;
    dsUltCompra: TwwDataSource;
    dsObs: TwwDataSource;
    cdsList: TCMClientDataSet;
    dsList: TwwDataSource;
    btnCopiaPrazo: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    TabForn: TTabSheet;
    dsDadosForn: TwwDataSource;
    dsUltCompForn: TwwDataSource;
    pcDadosForn: TPageControl;
    tbsEndForn: TTabSheet;
    Label26: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    lblEMailEmp: TLabel;
    Label33: TLabel;
    Label31: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edEndereco: TDBEdit;
    edCEP: TDBEdit;
    wwDBGrid1: TwwDBGrid;
    edCidade: TDBEdit;
    edEstado: TDBEdit;
    edPais: TDBEdit;
    tbsProdForn: TTabSheet;
    dbgrUltCompForn: TwwDBGrid;
    cdsUltCompForn: TCMClientDataSet;
    cdsDadosForn: TCMClientDataSet;
    FrameAgregadosCot: TFrameAgregados;
    edProc: TDBEdit;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dblcFornCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure edPrazoEntExit(Sender: TObject);
    procedure edPrazoPagExit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure btnCopiaPrazoClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure GrdArtRowChanged(Sender: TObject);
    procedure edPrecoExit(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dblcFornEnter(Sender: TObject);
  private
   Cotacao      : TCtrlCotacao;
   Artigo       : TCtrlArtigo;
   Moeda        : TCtrlMoeda;
   UnMedida     : TCtrlUnMedida;
   TipoAgregado : TCtrlTipoAgregado;
   //
   sUltForn     : String;
   Procedure Sel(CodProcesso,IdProcxArt,Proposta,idForCli: Double; SelCotacao : Boolean = True);
   Function  CalcQtdeEntregue   : Double;
   Function  CalcPercentualPgto : Double;
   Procedure CopiaPrazos;
   Procedure SelForn(CodProcesso,IdForCli : Double);

  public
    { Public declarations }
  end;

var
  FrmMTCotacao: TFrmMTCotacao;

implementation

{$R *.DFM}

Uses UMensErro, DBasedados, uSistema, uModulo, fAguarde;

procedure TFrmMTCotacao.FormCreate(Sender: TObject);
begin
  inherited;
  Cotacao := TCtrlCotacao.Create;
  Cotacao.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Cotacao.cdsCotacao        := cds;
  Cotacao.cdsPrazoEntrega   := cdsPrazoEntrega;
  Cotacao.cdsPrazoPgto      := cdsPrazoPgto;
  Cotacao.cdsValorAgreg     := cdsAgregados;
  //
  Artigo := TCtrlArtigo.Create;
  Artigo.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  Moeda :=  TCtrlMoeda.Create;
  Moeda.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  UnMedida := TCtrlUnMedida.Create;
  UnMedida.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  TipoAgregado := TCtrlTipoAgregado.Create;
  TipoAgregado.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  FrameAgregadosCot.TipoAgregado := TipoAgregado;

  TipoAgregado.cdsValorAgregTela := FrameAgregadosCot.cdsAgregados;
  Cotacao.cdsValorAgregTela      := FrameAgregadosCot.cdsAgregados;
  //
  cdsMoeda.Data := Moeda.ListaMoeda(0,True);

  MontaSelect.Filtro.Add('PROCESSO.IDCOMPRADOR = '+IntToStr(Sistema.IdUsuario ));

  Sel(-1,-1,-1,-1);

  SelForn(-1,-1);
end;

procedure TFrmMTCotacao.Sel(CodProcesso,IdProcxArt,Proposta,idForCli: Double; SelCotacao : Boolean);
begin
   If SelCotacao Then
      cdsList.Data := Cotacao.Procurar(CodProcesso,IdProcxArt,Proposta,IdForCli,Modulo.iCodAlmoxa)
   Else
      Begin
        cds.Data  := Cotacao.Procurar(cdsList.FieldByName('CODPROCESSO').asFloat,
                                            cdsList.FieldByName('IDPROCXART').asFloat,
                                            cdsList.FieldByName('PROPOSTA').asFloat,
                                            cdsList.FieldByName('IDFORCLI').asFloat,
                                            Modulo.iCodAlmoxa);

        cdsPrazoEntrega.Data := Cotacao.GetPrazoEntrega(cds.FieldByName('CODPROCESSO').asFloat,
                                                        cds.FieldByName('IDPROCXART').asFloat,
                                                        cds.FieldByName('PROPOSTA').asFloat,
                                                        cds.FieldByName('IDFORCLI').asFloat);

        cdsPrazoPgto.Data    := Cotacao.GetPrazoPgto(cds.FieldByName('CODPROCESSO').asFloat,
                                                     cds.FieldByName('IDPROCXART').asFloat,
                                                     cds.FieldByName('PROPOSTA').asFloat,
                                                     cds.FieldByName('IDFORCLI').asFloat);

        cdsAgregados.Data    := Cotacao.GetAgregados(cds.FieldByName('CODPROCESSO').asFloat,
                                                     cds.FieldByName('IDPROCXART').asFloat,
                                                     cds.FieldByName('PROPOSTA').asFloat,
                                                     cds.FieldByName('IDFORCLI').asFloat);

        FrameAgregadosCot.cdsAgregados.Data    := Cotacao.GetAgregadosTela(cds.FieldByName('CODPROCESSO').asFloat,
                                                         cds.FieldByName('IDPROCXART').asFloat,
                                                         cds.FieldByName('PROPOSTA').asFloat,
                                                         cds.FieldByName('IDFORCLI').asFloat);

        cdsUltCompra.Data    := Artigo.ListUltCompra(cds.FieldByName('CODARTIGO').asString);

        TFloatField(cdsUltCompra.FieldByName('QTDERECEBDEVOL')).DisplayFormat := '#,####0.0000';
        TFloatField(cdsUltCompra.FieldByName('VLRUNITARIO')).DisplayFormat    := '#,##0.00';
        TFloatField(cdsUltCompra.FieldByName('VALUNEST')).DisplayFormat       := '#,##0.00';

        cdsUnMedida.Data     := UnMedida.ListUnMedida(cds.FieldByName('CODPRODUTO').asString);
        cdsObs.Data          := Cotacao.ListObservacao(cds.FieldByName('CODARTIGO').asString,cds.FieldByName('CODPROCESSO').asFloat, cds.FieldByName('IDPROCXART').asFloat);
    End;
end;

procedure TFrmMTCotacao.dblcFornCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     Begin
        If sbtnAlterar.Down Then
           Begin
                    If cds.ChangeCount > 0 Then bbtnConfirmar.Click;

                    Sel( cdsFornecedor.FieldByName('CODPROCESSO').AsFloat,
                         -1,
                         cdsFornecedor.FieldByName('PROPOSTA').AsFloat,
                         cdsFornecedor.FieldByName('IDFORCLI').AsFloat);

                    sbtnAlterar.Click;

                    if cds.FieldByName('CONTATO').IsNull Then
                       cds.FieldByName('CONTATO').AsString :=  Cotacao.LeUltContato(cdsFornecedor.FieldByName('IDFORCLI').AsFloat,Sistema.IdEmpresa);

           End
        Else
          Sel( cdsFornecedor.FieldByName('CODPROCESSO').AsFloat,
               -1,
               cdsFornecedor.FieldByName('PROPOSTA').AsFloat,
               cdsFornecedor.FieldByName('IDFORCLI').AsFloat);

       cdsDadosForn.Data   := Cotacao.ListDadosFornecedor(cdsFornecedor.FieldByName('IDFORCLI').AsFloat);
       cdsUltCompForn.Data := Cotacao.ListUltCompraForn(cdsFornecedor.FieldByName('IDFORCLI').AsFloat);
     End;
end;

procedure TFrmMTCotacao.CmeDetalheDelete(Sender: TObject);
begin
    Case pgctrlDetalhe.ActivePage.PageIndex Of
       1: Begin
            If MsgDlg('Confirma a exclusão do Prazo de Entrega','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
               inherited;
          End;
       2: Begin
            If MsgDlg('Confirma a exclusão do Prazo de Pagamento','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
               inherited;
          End;
    End;
end;

procedure TFrmMTCotacao.edPrazoEntExit(Sender: TObject);
begin
  inherited;
  cdsPrazoEntrega.FieldByName('DATAENT').AsDateTime := Date + edPrazoEnt.Value;
end;

procedure TFrmMTCotacao.edPrazoPagExit(Sender: TObject);
begin
  inherited;
  cdsPrazoPgto.FieldByName('DATAPGTO').AsDateTime := Date + edPrazoPag.Value;
end;

procedure TFrmMTCotacao.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Begin
        Sel(StrToFloat(MontaSelect.ValoresChave[0]),-1,StrToFloat(MontaSelect.ValoresChave[2]),StrToFloat(MontaSelect.ValoresChave[3]));
        SelForn(StrToFloat(MontaSelect.ValoresChave[0]),StrToFloat(MontaSelect.ValoresChave[3]));
     End;
end;

procedure TFrmMTCotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 inherited;
 Cotacao.Free;
 Artigo.Free;
 Moeda.Free;
 UnMedida.Free;
 TipoAgregado.Free;
end;

procedure TFrmMTCotacao.CmeDetalheInsert(Sender: TObject);
Var
   rCem     : Double;
   rQtde    : Double;
   PercPgto : Double;
Begin
    rCem := 100;
    Case pgctrlDetalhe.ActivePage.PageIndex Of
       1: Begin
            rQtde := CalcQtdeEntregue;
            If Format('%12.2f',[cds.FieldByName('QTDEFORNECIDA').AsFloat]) <> Format('%12.2f',[rQtde]) Then
               Begin
                  inherited;
                  cdsPrazoEntrega.FieldByName('CODPROCESSO').AsFloat   := cds.FieldByName('CODPROCESSO').AsFloat;
                  cdsPrazoEntrega.FieldByName('IDPROCXART').AsFloat    := cds.FieldByName('IDPROCXART').AsFloat;
                  cdsPrazoEntrega.FieldByName('IDFORCLI').AsFloat      := cds.FieldByName('IDFORCLI').AsFloat;
                  cdsPrazoEntrega.FieldByName('PROPOSTA').AsFloat      := cds.FieldByName('PROPOSTA').AsFloat;
                  cdsPrazoEntrega.FieldByName('DATAENT').AsDateTime    := Date;
                  cdsPrazoEntrega.FieldByName('PERIODOPRAZO').AsString := 'D';
                  cdsPrazoEntrega.FieldByName('QTDEENT').AsFloat       := cds.FieldByName('QTDEFORNECIDA').AsFloat - rQtde;
                  cdsPrazoEntrega.FieldByName('CODMEDIDA').AsString    := cds.FieldByName('CODMEDIDA').AsString;
                  edDataEnt.Date              := Date;
                  edQtdeEnt.SetFocus;
               End
            Else
               Begin
                  MsgDlg('Quantidade fornecida já está completa','Informação',mtInformation,[mbOk],0);
                  bbtnVoltarDet.Click;
               End;
          End;
       2: Begin
            PercPgto := CalcPercentualPgto;
            If Format('%12.2f',[rCem]) <> Format('%12.2f',[CalcPercentualPgto]) Then
               Begin
                 inherited;
                 cdsPrazoPgto.FieldByName('CODPROCESSO').AsFloat   := cds.FieldByName('CODPROCESSO').AsFloat;
                 cdsPrazoPgto.FieldByName('IDPROCXART').AsFloat    := cds.FieldByName('IDPROCXART').AsFloat;
                 cdsPrazoPgto.FieldByName('IDFORCLI').AsFloat      := cds.FieldByName('IDFORCLI').AsFloat;
                 cdsPrazoPgto.FieldByName('PROPOSTA').AsFloat      := cds.FieldByName('PROPOSTA').AsFloat;
                 cdsPrazoPgto.FieldByName('DATAPGTO').AsDateTime   := Date;
                 cdsPrazoPgto.FieldByName('PERIODOPRAZO').AsString := 'D';
                 cdsPrazoPgto.FieldByName('PERCENT').AsFloat       := 100 - PercPgto;
                 edDataPag.Date                                    := Date;
                 edPercentPag.Value                                := 100 - PercPgto;
                 edPercentPag.SetFocus;
               End
             Else
               Begin
                  MsgDlg('Percentual igual a 100%','Informação',mtInformation,[mbOk],0);
                  bbtnVoltarDet.Click;
               End;
          End;
    End;
end;

function TFrmMTCotacao.CalcPercentualPgto: Double;
begin
    Result := 0;
    cdsPrazoPgto.DisableControls;
    Try
       cdsPrazoPgto.First;
       While Not cdsPrazoPgto.EOF Do
          Begin
             Result := Result + cdsPrazoPgto.FieldByName('PERCENT').AsFloat;
             cdsPrazoPgto.Next;
          End;
    Finally
       cdsPrazoPgto.EnableControls;
    End;
end;

function TFrmMTCotacao.CalcQtdeEntregue: Double;
begin
   Result := 0;
   cdsPrazoEntrega.DisableControls;
   Try
      cdsPrazoEntrega.First;
      While Not cdsPrazoEntrega.EOF Do
         Begin
            Result := Result + cdsPrazoEntrega.FieldByName('QTDEENT').AsFloat;
            cdsPrazoEntrega.Next;
         End;
   Finally
      cdsPrazoEntrega.EnableControls;
   End;

end;

procedure TFrmMTCotacao.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(Cotacao.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmMTCotacao.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Cotacao.Gravar;
end;

procedure TFrmMTCotacao.btnCopiaPrazoClick(Sender: TObject);
begin
  inherited;
  If Not cdsList.IsEmpty Then
     Begin
        bbtnConfirmar.Click;
        CopiaPrazos;
        sbtnAlterar.Click;
     End;
  btnCopiaPrazo.Down := False;
end;

procedure TFrmMTCotacao.CopiaPrazos;
Var
   PrazoEnt : TList;
   PrazoPag : TList;
   objEnt   : TPrazoEnt;
   objPag   : TPrazoPag;
   x        : Integer;
begin
//---------------------------------------------------------------------------------------------
// Incializa os vetores dinamicos para a quantidade de registos
// existente no prazos do primeiro artigo
//---------------------------------------------------------------------------------------------
  PrazoEnt := TList.Create;
  PrazoPag := TList.Create;
  cdsList.First;

  Sel( cdsList.FieldByName('CODPROCESSO').asFloat,
     cdsList.FieldByName('IDPROCXART').asFloat,
     cdsList.FieldByName('PROPOSTA').asFloat,
     cdsList.FieldByName('IDFORCLI').asFloat,False);


  // Prazo de Entrega
   cdsPrazoEntrega.First;
   While Not cdsPrazoEntrega.Eof Do
       Begin
          ObjEnt := TPrazoEnt.Create;
          ObjEnt.PRAZOENT     := cdsPrazoEntrega.FieldByName('PRAZOENT').AsFloat;
          ObjEnt.PERIODOPRAZO := cdsPrazoEntrega.FieldByName('PERIODOPRAZO').AsString;
          ObjEnt.CODMEDIDA    := cdsPrazoEntrega.FieldByName('CODMEDIDA').AsString;
          If cds.FieldByName('QTDEFORNECIDA').AsFloat > 0 Then
             ObjEnt.QTDEENT   := cdsPrazoEntrega.FieldByName('QTDEENT').AsFloat/cds.FieldByName('QTDEFORNECIDA').AsFloat
          Else
             ObjEnt.QTDEENT   := 0;

          ObjEnt.DATAENT      := cdsPrazoEntrega.FieldByName('DATAENT').AsDateTime;
          cdsPrazoEntrega.Next;
          PrazoEnt.Add(ObjEnt);
       End;
  // Prazo de Pagamento
   cdsPrazoPgto.First;
   While Not cdsPrazoPgto.Eof Do
       Begin
          ObjPag := TPrazoPag.Create;
          ObjPag.PRAZOPGTO    := cdsPrazoPgto.FieldByName('PRAZOPGTO').AsFloat;
          ObjPag.PERIODOPRAZO := cdsPrazoPgto.FieldByName('PERIODOPRAZO').AsString;
          ObjPag.PERCENT      := cdsPrazoPgto.FieldByName('PERCENT').AsFloat;
          ObjPag.DATAPGTO     := cdsPrazoPgto.FieldByName('DATAPGTO').AsDateTime;
          cdsPrazoPgto.Next;
          PrazoPag.Add(ObjPag);
       End;
   Try
     cdsList.DisableControls;
     //
     FrmAguarde.Min := 0;
     FrmAguarde.Max := cdsList.RecordCount;
     FrmAguarde.Pos := 0;
     //
     cdsList.Next;
     FrmAguarde.Mostra('Copiando Prazos Aguarde...');
     While Not cdsList.Eof Do
        Begin
           Sel( cdsList.FieldByName('CODPROCESSO').asFloat,
                cdsList.FieldByName('IDPROCXART').asFloat,
                cdsList.FieldByName('PROPOSTA').asFloat,
                cdsList.FieldByName('IDFORCLI').asFloat,False);

           If cdsPrazoEntrega.IsEmpty Then
           For x := 0 To Pred(PrazoEnt.Count) Do
               Begin
                  ObjEnt := TPrazoEnt(PrazoEnt.Items[x]);
                  cdsPrazoEntrega.Append;
                  cdsPrazoEntrega.FieldByName('CODPROCESSO').AsFloat   := cds.FieldByName('CODPROCESSO').AsFloat;
                  cdsPrazoEntrega.FieldByName('IDPROCXART').AsFloat    := cds.FieldByName('IDPROCXART').AsFloat;
                  cdsPrazoEntrega.FieldByName('PROPOSTA').AsFloat      := cds.FieldByName('PROPOSTA').AsFloat;
                  cdsPrazoEntrega.FieldByName('IDFORCLI').AsFloat      := cds.FieldByName('IDFORCLI').AsFloat;
                  cdsPrazoEntrega.FieldByName('QTDEENT').AsFloat       := cds.FieldByName('QTDEFORNECIDA').AsFloat * ObjEnt.QTDEENT;
                  cdsPrazoEntrega.FieldByName('CODMEDIDA').AsString    := ObjEnt.CODMEDIDA;
                  cdsPrazoEntrega.FieldByName('PRAZOENT').AsFloat      := ObjEnt.PRAZOENT;
                  cdsPrazoEntrega.FieldByName('PERIODOPRAZO').AsString := ObjEnt.PERIODOPRAZO;
                  cdsPrazoEntrega.FieldByName('DATAENT').AsDateTime    := ObjEnt.DATAENT;
                  cdsPrazoEntrega.Post;
               End;
           If cdsPrazoPgto.IsEmpty Then
           For x := 0 To Pred(PrazoPag.Count) Do
               Begin
                  ObjPag := TPrazoPag(PrazoPag.Items[x]);
                  cdsPrazoPgto.Append;
                  cdsPrazoPgto.FieldByName('CODPROCESSO').AsFloat   := cds.FieldByName('CODPROCESSO').AsFloat;
                  cdsPrazoPgto.FieldByName('IDPROCXART').AsFloat    := cds.FieldByName('IDPROCXART').AsFloat;
                  cdsPrazoPgto.FieldByName('PROPOSTA').AsFloat      := cds.FieldByName('PROPOSTA').AsFloat;
                  cdsPrazoPgto.FieldByName('IDFORCLI').AsFloat      := cds.FieldByName('IDFORCLI').AsFloat;
                  cdsPrazoPgto.FieldByName('PRAZOPGTO').AsFloat     := ObjPag.PRAZOPGTO;
                  cdsPrazoPgto.FieldByName('PERIODOPRAZO').AsString := ObjPag.PERIODOPRAZO;
                  cdsPrazoPgto.FieldByName('DATAPGTO').AsFloat      := ObjPag.DATAPGTO;
                  cdsPrazoPgto.FieldByName('PERCENT').AsFloat       := ObjPag.PERCENT;
                  cdsPrazoPgto.Post;
               End;
            If Not Cotacao.Gravar Then
               MsgDlg(Cotacao.MessageInfo ,'Erro',mtError,[mbOk],0);

            cdsList.Next;
            FrmAguarde.Pos := FrmAguarde.Pos + 1;
            Application.ProcessMessages;
        End;
   Finally
      // Libera os objetos da memoria
      While PrazoEnt.Count > 0 Do
         Begin
            TPrazoEnt(PrazoEnt.Items[0]).Free;
            PrazoEnt.Delete(0);
         End;
       While PrazoPag.Count > 0 Do
         Begin
            TPrazoPag(PrazoPag.Items[0]).Free;
            PrazoPag.Delete(0);
         End;
      PrazoEnt.Free;
      PrazoPag.Free;
      FrmAguarde.Apaga;
      CdsList.First;

      Sel( cdsList.FieldByName('CODPROCESSO').asFloat,
           cdsList.FieldByName('IDPROCXART').asFloat,
           cdsList.FieldByName('PROPOSTA').asFloat,
           cdsList.FieldByName('IDFORCLI').asFloat,False);

      CdsList.EnableControls;

      Cds.Edit;
   End;
end;

procedure TFrmMTCotacao.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  btnCopiaPrazo.Enabled := sbtnAlterar.Enabled;
  TabPrecos.Enabled     := sbtnAlterar.Down;
end;

procedure TFrmMTCotacao.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
end;

procedure TFrmMTCotacao.GrdArtRowChanged(Sender: TObject);
Var
  bAlterou :Boolean;
begin
  inherited;
  bAlterou := False;
  If sbtnAlterar.Down Then
     Begin
        bAlterou := True;

        cds.Post;

        If cds.ChangeCount > 0 Then
           Begin
              bbtnConfirmar.Click;
           End;
     end;

  Sel( cdsList.FieldByName('CODPROCESSO').asFloat,
       cdsList.FieldByName('IDPROCXART').asFloat,
       cdsList.FieldByName('PROPOSTA').asFloat,
       cdsList.FieldByName('IDFORCLI').asFloat,False);

  if bAlterou Then
     sbtnAlterar.Click;
end;

procedure TFrmMTCotacao.SelForn(CodProcesso, IdForCli: Double);
begin
   cdsFornecedor.Data   := Cotacao.ListFornecedor( CodProcesso );
   dblcForn.LookupValue := FloatToStr(IdForCli)+'1';
   Application.ProcessMessages;
   cdsDadosForn.Data    := Cotacao.ListDadosFornecedor( IdForCli );
   cdsUltCompForn.Data  := Cotacao.ListUltCompraForn( IdForCli );
end;

procedure TFrmMTCotacao.edPrecoExit(Sender: TObject);
begin
  inherited;
  if (Cds.State in ([DsEdit,DsInsert])) and (edPreco.Value <> 0) then
     Begin
        FrameAgregadosCot.CodProduto := Copy(cdsList.FieldByName('CODARTIGO').AsString,1,6);
        FrameAgregadosCot.CodEstado  := cdsDadosForn.FieldByName('CODESTADO').AsString;
        FrameAgregadosCot.IdPais     := cdsDadosForn.FieldByName('IDPAIS').AsFloat;
        FrameAgregadosCot.rValorMerc := (edPreco.Value*edQtdeForn.Value);
        if cdsAgregados.IsEmpty then
           TipoAgregado.CalcImpAuto(FrameAgregadosCot.IdPais,StrToIntDef(Modulo.sCodTipoDoc,-1),
                                    cdsDadosForn.FieldByName('IDPESSOA').AsFloat,
                                    Sistema.IdEmpresa, FrameAgregadosCot.rValorMerc,
                                    cdsPrazoPgto.FieldByName('DATAPGTO').AsDateTime,
                                    cds.FieldByName('DATACOT').AsDateTime,
                                    cds.FieldByName('CODTIPRECDES').AsString,
                                    FrameAgregadosCot.CodProduto,
                                    cdsDadosForn.FieldByName('CODESTADO').AsString);
     end;
end;

procedure TFrmMTCotacao.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if edPreco.CanFocus then edPreco.SetFocus;
end;

procedure TFrmMTCotacao.dblcFornEnter(Sender: TObject);
begin
  inherited;
  sUltForn := dblcForn.LookupValue;
end;

end.

