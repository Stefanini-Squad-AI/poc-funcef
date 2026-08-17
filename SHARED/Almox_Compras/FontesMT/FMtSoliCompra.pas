{ DAVID - 17/07/2003 - Pendência 14524 Incluída opção de Opções de Destino.}
// Marchetti - Pendencia 15659
// Várias rotinas implementadas para solução da pendência
// FMTSoliCompra, UCtrlOrcamento, uCtrlCotacao

unit FMtSoliCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBTables, Wwquery, Mask,
  DBCtrls, TREdit, wwdblook, wwdbdatetimepicker, CMDateTimePicker, fcLabel,
  fcButton, fcImgBtn, uCtrlSoliCompra, uCtrlArtigo,uCtrlUnMedida, uCMTypes,
  uCtrlCentRespon, uCtrlUnidNEgocio, uCtrlContratoProd, Provider, TB97Tlwn,
  uCtrlOrcamento, uCtrlAlmoxCompra;

type
  TFrmMtSoliCompra = class(TFrmCadastroMestreDetMT)
    edNumSoli: TDBEdit;
    Label1: TLabel;
    GpDotOrc: TGroupBox;
    btnOrcamento: TSpeedButton;
    ReResOrc: TRealEdit;
    lbAlmoxDestino: TLabel;
    EdAlmoxaDestino: TEdit;
    Label6: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    Label7: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    Label2: TLabel;
    dbdteEmissao: TCMDateTimePicker;
    Label3: TLabel;
    dbdteNecessidade: TCMDateTimePicker;
    cdsArtigo: TCMClientDataSet;
    imgAnaSint: TfcImageBtn;
    cdsDet: TCMClientDataSet;
    Label4: TLabel;
    Label11: TLabel;
    dbedValorUn: TDBRealEdit;
    Label5: TLabel;
    Label8: TLabel;
    dbreOBS: TDBRichEdit;
    Label9: TLabel;
    dbQtde: TDBRealEdit;
    cdsUnMedida: TCMClientDataSet;
    Label10: TLabel;
    dblcUN: TwwDBLookupCombo;
    dblcItem: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    cdsUnidNegoc: TCMClientDataSet;
    cdsCentRespon: TCMClientDataSet;
    edValTot: TDBRealEdit;
    Label12: TLabel;
    CdsContrato: TCMClientDataSet;
    MsResORc: TMontaSelect;
    twObs: TToolWindow97;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    DBRichEdit1: TDBRichEdit;
    pnlAmbos: TPanel;
    rgDestino: TDBRadioGroup;
    pnlUm: TPanel;
    GroupBox1: TGroupBox;
    lblDestino: TLabel;
    cdsParamCompras: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure rgDestinoChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dblcUNCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private

    AlmoxCompra : TCtrlAlmoxCompra;
    sOpDestino  : string;

    { Private declarations }
    sGrupoProd     : String;
    SoliCompra     : TCtrlSoliCompra;
    Artigo         : TCtrlArtigo;
    UnMedida       : TCtrlUnMedida;
    CentRespon     : TCtrlCentRespon;
    UnidNegocio    : TCtrlUnidNegocio;
    ContratoProd   : TCtrlContratoProd;
    Orcamento      : TOrcamentoBackMT;
    sCodCentRespon : String;

    Procedure  SelMestreDet( n : Double );
    Procedure  ViewContrato( sCodArtigo : String );
    Function   SetGrupoProd : String;

    procedure MudaDestino;
  public
    Procedure  CalculaValorTotal;
    { Public declarations }
  end;

var
  FrmMtSoliCompra: TFrmMtSoliCompra;

implementation

{$R *.DFM}

Uses DBaseDados, uMensErro, uSistema, uModulo, FMTViewContrato,uCtrlParamIntegra;

procedure TFrmMtSoliCompra.FormCreate(Sender: TObject);
begin
  inherited;
  GpDotOrc.Enabled := ParamIntegra.IntegraOrcamento;

  sGrupoProd := '';

  SoliCompra := TCtrlSoliCompra.Create;
  SoliCompra.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  SoliCompra.cds     := cds;
  SoliCompra.cdsItem := cdsDet;
  //
  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(SoliCompra);
  //
  unMedida := TCtrlUnMedida.Create;
  unMedida.InitializeAs(SoliCompra);
  //
  CentRespon := TCtrlCentRespon.Create;
  CentRespon.InitializeAs(SoliCompra);
  //
  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.InitializeAs(SoliCompra);
  //
  ContratoProd := TCtrlContratoProd.Create;
  ContratoProd.InitializeAs(SoliCompra);
  //
  Orcamento := TOrcamentoBackMT.Create;
  Orcamento.InitializeAs(SoliCompra);
  //
  //--------------------------------------------------------------------------//
  AlmoxCompra := TCtrlAlmoxCompra.Create;
  AlmoxCompra.InitializeAs(SoliCompra);

  cdsParamCompras.Data := AlmoxCompra.GetParamCompras( Sistema.IdEmpresa );
  sOpDestino := cdsParamCompras.FieldByName('OPDESTINO').AsString;

  if sOpDestino = 'A' then
  begin
    pnlAmbos.Visible := True;
    pnlAmbos.BringToFront;
  end
  else
  begin
    pnlUm.Visible := True;
    pnlUm.BringToFront;
    if sOpDestino = 'E' then
      lblDestino.Caption := 'Estoque'
    else
      lblDestino.Caption := 'Custo';
    MudaDestino;
  end;
  //--------------------------------------------------------------------------//

  cdsArtigo.Data := Artigo.ListArtigo;
  //
  If GpDotOrc.Enabled Then
     MsResORc.Filtro.Add('RESERVAORCAMEN.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  MontaSelect.Filtro.add('SOLICOMP.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('CENTRESPON.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('UNIDNEGOCIO.IDPESSOA = '+IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('SOLICOMP.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa));
  //
  SelMestreDet(-1);

  cdsCentRespon.Data := CentRespon.ListaCentResponXUsu(Sistema.IdUsuario,Sistema.IdEmpresa,tcrSoAnalitica,tocrNome);

  cdsUnidNegoc.Data  := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);

end;

procedure TFrmMtSoliCompra.SelMestreDet(n: Double);
begin
  cds.Data       := SoliCompra.Procurar( n );
  cdsDet.Data    := SoliCompra.GetItem( n, Modulo.iCodCusteio );

  If Cds.FieldByName('IDRESERVAORCAMEN').AsInteger > 0 Then
  Begin
     Orcamento.IdEmpresa := Sistema.IdEmpresa;
     ReResOrc.Value  := Orcamento.BuscaIdNumReserva(Cds.FieldByName('IDRESERVAORCAMEN').AsInteger,0,False);
     sCodCentRespon  := Orcamento.BuscaCentRespon(Cds.FieldByName('IDRESERVAORCAMEN').AsInteger,0,False);
  End;
end;

procedure TFrmMtSoliCompra.rgDestinoChange(Sender: TObject);
begin
  inherited;
  sOpDestino := rgDestino.Value;
  MudaDestino;
end;

procedure TFrmMtSoliCompra.CmeCadastroInsert(Sender: TObject);
begin
  SelMestreDet(-1);
  inherited;
  ReResOrc.Value := 0;
  //
  cds.FieldByName('IDPESSOA').asInteger         := Sistema.IdEmpresa;
  cds.FieldByName('IDEMPRESA').asInteger        := Sistema.IdEmpresa;
  cds.FieldByName('CODCENTROCUSTO').asString    := Modulo.sCodCCusto;
  cds.FieldByName('CODALMOXARIFADO').asInteger  := Modulo.iCodAlmoxa;
  cds.FieldByName('SOLICIACEITA').asString      := 'F';
  cds.FieldByName('SOLICIATENDIDA').asString    := 'F';
  cds.FieldByName('IMPRESSO').asString          := 'F';

  cds.FieldByName('CUSTOESTOQUE').AsString      := sOpDestino;

  cDS.FieldByName('FLGPREPRONTA').AsString      := 'N';
  cds.FieldByName('DATAEMISSAO').AsDateTime     := Date;
  cds.FieldByName('DATAENTREGA').AsDateTime     := Date;

  dblcCentRespon.SetFocus;
end;

procedure TFrmMtSoliCompra.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Begin
        SelMestreDet( StrToFloat(MontaSelect.ValoresChave[0]) );
        Cds.Edit;
        CalculaValorTotal;
        Cds.Post;
     End;

end;

procedure TFrmMtSoliCompra.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If SoliCompra.PossuiItemEmCotacao(cds.FieldByName('NUMSOLCOMPRA').AsInteger) Then
     Begin
        MsgDlg('Esta solicitação já possui itens atribuidos para compra.E proibido altera-lá ','Erro',mtError,[mbOk],0);
        bbtnCancelar.click;
     End;
end;

procedure TFrmMtSoliCompra.CmeCadastroDelete(Sender: TObject);
begin
  cdsDet.First;
  While Not cdsDet.Eof Do cdsDet.Delete;
  inherited;
end;

procedure TFrmMtSoliCompra.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  cdsDet.FieldByName('IDFORNE').AsInteger  := -1;
  dblcItem.SetFocus;
end;

procedure TFrmMtSoliCompra.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Var
   iAux      : LongInt;
   sDescProd : String;
begin
  inherited;
  If modified Then
     Begin
        dblcDesc.LookUpValue := dblcItem.LookUpValue;
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        cdsUnMedida.Data := UnMedida.ListUnMedida( dblcItem.LookUpValue );

        iAux := -1;
        if cdsArtigo.FieldByName('FLGVARIAVEL').asString = 'S' Then
           iAux := Modulo.ProdVari( sDescProd );

        If iAux > 0 Then
           Begin
              cdsDet.FieldByName('IDPRODVARI').AsInteger := iAux;
              cdsDet.FieldByName('DESCRICAO').AsString   := Copy(sDescProd,1,60);
           End
        Else
          Begin
             cdsDet.FieldByName('IDPRODVARI').Clear;
             cdsDet.FieldByName('DESCRICAO').AsString := dblcDesc.Text;
          End;
        If Modulo.MessageInfo <> '' Then
           MsgDlg(Modulo.MessageInfo,'Erro',mtError,[mbOk],0);

        CdsDet.FieldByName('CODGRUPOPROD').AsString := cdsArtigo.FieldByName('CODGRUPOPROD').AsString;

        ViewContrato(dblcItem.LookUpValue);
     End;
end;

procedure TFrmMtSoliCompra.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Var
   iAux      : LongInt;
   sDescProd : String;
begin
  inherited;
  If modified Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        dblcDesc.LookUpValue := dblcItem.LookUpValue;
        cdsUnMedida.Data := UnMedida.ListUnMedida( dblcItem.LookUpValue );

        iAux := -1;
        if cdsArtigo.FieldByName('FLGVARIAVEL').asString = 'S' Then
           iAux := Modulo.ProdVari( sDescProd );

        If iAux > 0 Then
           Begin
              cdsDet.FieldByName('IDPRODVARI').AsInteger := iAux;
              cdsDet.FieldByName('DESCRICAO').AsString   := Copy(sDescProd,1,60);
           End
        Else
          Begin
             cdsDet.FieldByName('IDPRODVARI').Clear;
             cdsDet.FieldByName('DESCRICAO').AsString := dblcDesc.Text;
          End;
        If Modulo.MessageInfo <> '' Then
           MsgDlg(Modulo.MessageInfo,'Erro',mtError,[mbOk],0);

        CdsDet.FieldByName('CODGRUPOPROD').AsString := cdsArtigo.FieldByName('CODGRUPOPROD').AsString;

        ViewContrato(dblcItem.LookUpValue);
     End
end;

procedure TFrmMtSoliCompra.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := SoliCompra.Excluir;
end;

procedure TFrmMtSoliCompra.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  sGrupoProd := SetGrupoProd;
  Accept := SoliCompra.Gravar(edValTot.Value,Sistema.IdUsuario,sGrupoProd );
end;

procedure TFrmMtSoliCompra.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  sGrupoProd := SetGrupoProd;
  Accept := SoliCompra.Gravar(edValTot.Value,Sistema.IdUsuario,sGrupoProd );
  If Accept Then
     MsgDlg(SoliCompra.MessageInfo,'Informação',mtInformation,[mbOK],0);
end;

procedure TFrmMtSoliCompra.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(SoliCompra.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmMtSoliCompra.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  If cds.State in dsEditModes Then
     MsgDlg(SoliCompra.MessageInfo,'Informação',mtInformation,[mbOk],0);

end;

procedure TFrmMtSoliCompra.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  If cds.State = dsBrowse Then
     imgAnaSint.Down := cds.FieldByName('SOLICIATENDIDA').asString = 'T';
end;

procedure TFrmMtSoliCompra.CalculaValorTotal;
Var
   rValorTotal : Double;
Begin
  rValorTotal:= 0;
  If Not CdsDet.IsEmpty Then
     Begin
        CdsDet.DisableControls;
        Try
           CdsDet.First;
           While Not CdsDet.Eof do
           Begin
              rValorTotal:= rValorTotal + CdsDet.FieldByName('VALORTOTAL').AsFloat;
              CdsDet.Next;
           end;
        Finally
           Cds.FieldByName('SCIVALTOT').AsFloat := rValorTotal;
           edValTot.Value := rValorTotal;
           CdsDet.EnableControls;
        End;
     End;
end;

procedure TFrmMtSoliCompra.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  CalculaValorTotal;
end;

procedure TFrmMtSoliCompra.bbtnOkDetClick(Sender: TObject);
Var
   bInsert : Boolean;
begin
  bInsert := cdsDet.State = dsInsert;

  CdsDet.FieldByName('SALDOACOMPRAR').AsFloat := CdsDet.FieldByName('QTDEPEDIDA').AsFloat;
  CdsDet.FieldByName('QTDEPENDENTE').AsFloat  := CdsDet.FieldByName('QTDEPEDIDA').AsFloat;
  CdsDet.FieldByName('VALORTOTAL').AsFloat    := CdsDet.FieldByName('QTDEPEDIDA').AsFloat * CdsDet.FieldByName('VALORUN').AsFloat;
  CalculaValorTotal;
  CdsDet.Edit;

  inherited;

  If bInsert Then
    sbtnInsDet.Click
  Else
    sbtnAltDet.Click;

end;

procedure TFrmMtSoliCompra.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  cdsDet.Cancel;
  CalculaValorTotal;
end;

procedure TFrmMtSoliCompra.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  CalculaValorTotal;
end;

procedure TFrmMtSoliCompra.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := True;
  If trim(dblcCentRespon.Text ) = '' Then
     Begin
        MsgDlg('Centro de responsabilidade não foi preenchido','Erro',mtError,[mbOk],0);
        dblcCentRespon.SetFocus;
        Accept := False;
     End;
  If (GpDotOrc.Enabled) and (ReResOrc.Value = 0) Then
     Begin
        MsgDlg('Obrigatório indicar a reserva orçamentária','Erro',mtError,[mbOk],0);
        ReResOrc.SetFocus;
        Accept := False;
     End;

  // Verifica se o CR escolhido é igual ao informado na Reserva
  if (ReResOrc.Value > 0 ) and (sCodCentRespon <> dblcCentRespon.LookupValue) then
  begin
     MsgDlg('O Centro de Responsabilidade escolhido difere do Centro de Responsabilidade informado na Reserva Orçamentária','Erro',mtError,[mbOk],0);
     dblcCentRespon.SetFocus;
     Accept := False;
  end;

  If trim(dblcAtiv.Text ) = '' Then
     Begin
        MsgDlg('Atividade/Projeto não foi preenchido','Erro',mtError,[mbOk],0);
        dblcAtiv.SetFocus;
        Accept := False;
     End;
  If trim(dbdteEmissao.Text) = '' Then
     Begin
        MsgDlg('Data de Emissão não foi Preenchida','Erro',mtError,[mbOk],0);
        Accept := False;
        Exit;
     end;
  If trim(dbdteNEcessidade.Text) = '' Then
     Begin
        MsgDlg('Data de Necessidade não foi Preenchida','Erro',mtError,[mbOk],0);
        Accept := False;
        Exit;
     end;
  If dbdteEmissao.Date > dbdteNecessidade.Date Then
     Begin
        MsgDlg('Data de Emissão não pode ser maior que a data de necessidae ','ERRO',mtError,[mbOk],0);
        dbdteEmissao.SetFocus;
        Accept := False;
     End;
  If CdsDet.IsEmpty  Then
     Begin
        MsgDlg('Não ha nenhum item preenchido','Erro',mtError,[mbOk],0);
        dbdteEmissao.SetFocus;
        Accept := False;
     End;

  If Orcamento.IdReserva <> 0 Then
     Cds.FieldByName('IDRESERVAORCAMEN').AsInteger := Orcamento.IdReserva;
end;

procedure TFrmMtSoliCompra.ViewContrato(sCodArtigo: String);
begin
   CdsContrato.Data := ContratoProd.GetContrato(sCodArtigo);
   If Not CDsContrato.IsEmpty Then
      Begin
         Application.CreateForm(TFrmMTViewContrato,FrmMTViewContrato);
         FrmMTViewContrato.plnTitulo.Caption  := ' Artigo : '+sCodArtigo+ '   -   '+dblcDesc.Text;
         FrmMTViewContrato.dsContrato.DataSet :=  CdsContrato;

         If FrmMTViewContrato.ShowModal = mrOk Then
            Begin
                With CdsContrato Do
                   Begin
                      CdsDet.FieldByName('IDCONTRATOPROD').asFloat := FieldByName('IDCONTRATOPROD').asFloat;
                      CdsDet.FieldByName('VALORUN').asFloat        := FieldByName('VLRUNITARIO').asFloat;
                      CdsDet.FieldByName('CODMEDIDA').asString     := FieldByName('CODMEDIDA').asString;
                      CdsDet.FieldByName('QTDEPEDIDA').asFloat     := FieldByName('QTDEESPERADA').asFloat;
                      CdsDet.FieldByName('IDFORNE').AsInteger      := FieldByName('IDFORCLI').asInteger;
                      CdsDet.FieldByName('PRAZOPAG').AsInteger     := FieldByName('PRAZOPAG').asInteger;
                      CdsDet.FieldByName('IDCOMPRADOR').AsInteger  := FieldByName('IDCOMPRADOR').asInteger;
                      dbedValorUn.Value                            := FieldByName('VLRUNITARIO').asFloat;
                   End;
            End;
      End;
end;


procedure TFrmMtSoliCompra.dblcUNCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     dbedValorUn.Value := UnMedida.ValorToUnCustoMedio(cdsArtigo.FieldByName('CODARTIGO').AsString,
                                                       dblcUN.LookupValue,
                                                       Modulo.iCodAlmoxa );
end;

procedure TFrmMtSoliCompra.btnOrcamentoClick(Sender: TObject);
begin
  inherited;
  MsResORc.Executar;
  If  MsResORc.RetornouValor Then
     Begin
        ReResOrc.Value      := StrToInt(MsResORc.ValoresChave[1]);
        Orcamento.IdReserva := StrToInt(MsResORc.ValoresChave[0]);

        // Retorna o valor do Centro de Responsabilidade da Reserva
        sCodCentRespon      := MsResORc.ValoresChave[2];
     End;
end;

procedure TFrmMtSoliCompra.dbgrdDetDblClick(Sender: TObject);
begin
  twObs.Show;
end;

procedure TFrmMtSoliCompra.BitBtn1Click(Sender: TObject);
begin
  twObs.Hide;
end;

Function TFrmMtSoliCompra.SetGrupoProd : String;
begin
  If Not CdsDet.IsEmpty Then
     Begin
        CdsDet.DisableControls;
        Try
           CdsDet.First;
           Result := CdsDet.FieldByName('CODGRUPOPROD').AsString;
        Finally
           CdsDet.EnableControls;
        End;
     End;
end;

procedure TFrmMtSoliCompra.MudaDestino;
begin
  If sOpDestino = 'C' Then
  Begin
    lbAlmoxDestino.Caption:= 'Centro Custo Destino';
    EdAlmoxaDestino.Text:= Modulo.sDescCCusto;
  end
  else
  Begin
    lbAlmoxDestino.Caption:= 'Almoxarifado Destino';
    EdAlmoxaDestino.Text:= Modulo.sAlmoxaUsuario;
  end;
end;

end.


