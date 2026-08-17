unit fCadCliente;
{ --------------------------------------------------------------------------------------------------
Rotina ......: MsAtividadeProjeto
SOL..........: 163982
Kintana......: 1404974
Data.........: 23/09/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi adicionado um filtro para o componente MsAtividadeProjeto
               retornar apenas as atividades ativas
Alteração DFM: Foi alterado o componente MsAtividadeProjeto.
-----------------------------------------------------------------------------------------------------}
//---------------------------------------------------------------------//
// Pendência 17486 - FDias - 22.10.2004 - retirada de campos           //
//---------------------------------------------------------------------//
{ 19543 - retirar o campo de classificação fiscal - andre tavares }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, Buttons, DBCtrls, CMProcura, StdCtrls,
  CheckLst, ComCtrls, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  Wwdbspin, ExtCtrls, TabControlDetalhe, Grids, Wwdbigrd, Wwdbgrid, Mask,
  wwdbedit, TB97Ctls, wwdblook, CMDBLookupCombo, TB97Tlwn, CMProcuraMask,
  CMProcuraSubTipo;

type
  TfrmCadCliente = class(TFrmPessoaMT)
    TbsDadosCliente: TTabSheet;
    TbsTipoReceb: TTabSheet;
    TbsImpAgreg: TTabSheet;
    TbsTiposCliente: TTabSheet;
    CdsEmpresaCliente: TCMClientDataSet;
    DsEmpresaCliente: TwwDataSource;
    TbsGeral: TPageControl;
    TbsDados: TTabSheet;
    Label2: TLabel;
    dbedCodigoCli: TwwDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    TbsContabil: TTabSheet;
    CContabil: TCMProcuraMaskContabil;
    CContabilCredito: TCMProcuraMaskContabil;
    CContabilAdiantamento: TCMProcuraMaskContabil;
    Panel5: TPanel;
    Label23: TLabel;
    Label26: TLabel;
    Label4: TLabel;
    CmpSubConta: TCMProcura;
    CmpCentroCusto: TCMProcura;
    CmpAtivProj: TCMProcura;
    MsClasFisCliFor: TMontaSelect;
    MsTipoCliente: TMontaSelect;
    MsSubConta: TMontaSelect;
    MsCentroCusto: TMontaSelect;
    MsAtividadeProjeto: TMontaSelect;
    BtnDelTipoReceb: TSpeedButton;
    BtnAddTipoReceb: TSpeedButton;
    PnlTipoRecebCli: TPanel;
    GrdTipoRecebCli: TwwDBGrid;
    PnlTipoReceb: TPanel;
    GrdTipoReceb: TwwDBGrid;
    BtnAddImpAgreg: TSpeedButton;
    BtnDelImpAgreg: TSpeedButton;
    PnlImpAgregCli: TPanel;
    GrdImpAgreg: TwwDBGrid;
    PnlImpAgreg: TPanel;
    GrdImpAgregCli: TwwDBGrid;
    BtnDelTipos: TSpeedButton;
    BtnAddTipos: TSpeedButton;
    GrdTiposCli: TwwDBGrid;
    GrdTipos: TwwDBGrid;
    PnlTipos: TPanel;
    PnlTiposCli: TPanel;
    CdsTipoReceb: TCMClientDataSet;
    CdsTipoRecebCli: TCMClientDataSet;
    CdsImAgreg: TCMClientDataSet;
    CdsImAgregCli: TCMClientDataSet;
    CdsTipos: TCMClientDataSet;
    CdsTiposCli: TCMClientDataSet;
    DsTipoReceb: TwwDataSource;
    DsImAgreg: TwwDataSource;
    DsTipos: TwwDataSource;
    DsTipoRecebCli: TwwDataSource;
    DsImAgregCli: TwwDataSource;
    DsTiposCli: TwwDataSource;
    TbsObservacoes_Padrao: TTabSheet;
    MemObs: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure BtnDelTipoRecebClick(Sender: TObject);
    procedure BtnAddTipoRecebClick(Sender: TObject);
    procedure BtnAddImpAgregClick(Sender: TObject);
    procedure BtnDelImpAgregClick(Sender: TObject);
    procedure BtnDelTiposClick(Sender: TObject);
    procedure BtnAddTiposClick(Sender: TObject);
    procedure GrdTipoRecebCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure GrdTipoRecebCliCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure CdsSubTipoAfterOpen(DataSet: TDataSet);
    procedure CmpCentroCustoApertouBotao(Sender: TObject);
    procedure CdsEmpresaClienteBeforePost(DataSet: TDataSet);
    procedure CdsEmpresaClienteAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation
                                                                           
Uses uCtrlParamIntegra, uSistema, uString, uCtrlPessoaCliente, dBaseDados,
     uCMTypes, uCtrlPessoa, uMensErro;

{$R *.DFM}

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaCliente.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                    Sistema.ConnectionSide, Sistema.AppRemoteServer,True);
  Pessoa.SubTipo := stCliente;
  Pessoa.TipoPessoa := tpOpcional;
  Pessoa.UsaPessoaFisica := True;

  TCtrlPessoaCliente(Pessoa).CdsEmpresaCliente := CdsEmpresaCliente;
  TCtrlPessoaCliente(Pessoa).CdsTipoRecebCli := CdsTipoRecebCli;
  TCtrlPessoaCliente(Pessoa).CdsImAgregCli := CdsImAgregCli;
  TCtrlPessoaCliente(Pessoa).CdsTiposCli := CdsTiposCli;

  inherited;

  MontaSelect.Filtro.Append('EMPRESACLIENTE.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  
  MsSubConta.Filtro.Append('SUBCONTA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  MsAtividadeProjeto.Filtro.Append('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  MsCentroCusto.Filtro.Clear;
  MsCentroCusto.Filtro.Append('CONTASXCC.IDEMPRESA = CENTCUST.IDEMPRESA');
  MsCentroCusto.Filtro.Append('CONTASXCC.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO');
  MsCentroCusto.Filtro.Append('CONTASXCC.PLANO = ' + InttoStr(ParamIntegra.Plano));
  MsCentroCusto.Filtro.Append('CONTASXCC.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa));
  MsCentroCusto.Filtro.Append('CONTASXCC.PLACONTA = ' + QuotedStr(Espaco('',18)));

  CmpSubConta.FiltroProcura := 'IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
  CmpCentroCusto.FiltroProcura := 'IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa);
  CmpAtivProj.FiltroProcura := 'IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

  TbsContabil.TabVisible := (ParamIntegra.IntegraContabRec);
  If TbsContabil.TabVisible Then
  Begin
    CContabil.Plano := ParamIntegra.Plano;
    CContabil.Mascara := ParamIntegra.MascaraPlano;

    CContabilAdiantamento.Plano := ParamIntegra.Plano;
    CContabilAdiantamento.Mascara := ParamIntegra.MascaraPlano;

    CContabilCredito.Plano := ParamIntegra.Plano;
    CContabilCredito.Mascara := ParamIntegra.MascaraPlano;
  End;
end;

procedure TfrmCadCliente.SelSubTipo(rIdPessoa: Double);
begin
  inherited;

  If Not TCtrlPessoaCliente(Pessoa).SelDadosCliente(Sistema.IdEmpresa, rIdPessoa, cdsSubTipo,
     cdsEmpresaCliente, cdsTipoReceb, cdsTipoRecebCli, cdsImAgreg, cdsImAgregCli, cdsTipos,
     cdsTiposCli) Then Raise Exception.Create(Pessoa.MessageInfo);
end;

procedure TfrmCadCliente.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsEmpresaCliente.Insert;
  CdsEmpresaCliente.FieldByName('FLGSTATUS').AsString := 'A';
  CdsEmpresaCliente.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;  
end;

procedure TfrmCadCliente.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  CdsEmpresaCliente.Edit;

  If CdsEmpresaCliente.FieldByName('FLGSTATUS').IsNull Then
     CdsEmpresaCliente.FieldByName('FLGSTATUS').AsString := 'A';

  CdsEmpresaCliente.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
end;

procedure TfrmCadCliente.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, Opalterar]) And Accept Then
  Begin
    Accept := TCtrlPessoaCliente(Pessoa).VerificaCodCorresp(dbedCodigoCli.Text,Cds.FieldByName('IDPESSOA').AsFloat);

    If Accept Then
    Begin
       If Accept Then
       Begin
          Accept := (Not CdsTiposCli.IsEmpty);

	  If Accept Then
          Begin
             If ParamIntegra.IntegraContabRec Then
             Begin
                Accept := ((CContabil.Valida = VcOk) And
                           (CContabilAdiantamento.Valida = VcOk) And
                           (CContabilCredito.Valida = VcOk));

                If Accept Then
                Begin

                  if Not ParamIntegra.CriaSubContaClie then
                     CmpSubConta.PermiteChaveEmBranco := (Not CContabil.Conta.ObrigaSubConta);

                  Accept := (CmpSubConta.Valida = VcOk);

                  if Accept then
                  begin
                    TCtrlPessoaCliente(Pessoa).CriaSubConta := ParamIntegra.CriaSubContaClie And
                                                               CContabil.Conta.ObrigaSubConta;

                    CmpCentroCusto.PermiteChaveEmBranco := (Not CContabil.Conta.ObrigaCentrodeCusto);
                    Accept := (CmpCentroCusto.Valida = VcOk);

                    if Accept then
                       Accept := (CmpAtivProj.Valida = VcOk);
                  end;
                End;
             End;

          End
          Else
            MsgDlg('Tipo de CLiente não informado', 'Atenção', mtInformation, [mbOk],0);
       End;
    End
    Else
      MsgDlg(Pessoa.MessageInfo, 'Atenção', mtInformation, [mbOk],0);
  End;
end;

procedure TfrmCadCliente.BtnDelTipoRecebClick(Sender: TObject);
Var
  sCodDesemb: String;
begin
  inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsTipoRecebCli.IsEmpty) Then
  Begin
    sCodDesemb := Trim(CdsTipoRecebCli.FieldByName('CODTIPRECDES').AsString);
    Repeat
      CdsTipoReceb.Append;
      CdsTipoReceb.FieldByName('CODTIPRECDES').AsString := CdsTipoRecebCli.FieldByName('CODTIPRECDES').AsString;
      CdsTipoReceb.FieldByName('DESCRICAO').AsString    := CdsTipoRecebCli.FieldByName('DESCRICAO').AsString;
      CdsTipoReceb.FieldByName('ANASINT').AsString      := CdsTipoRecebCli.FieldByName('ANASINT').AsString;
      CdsTipoReceb.FieldByName('RECPAG').AsString       := 'R';
      CdsTipoReceb.FieldByName('IDPESSOA').AsFloat    := Sistema.IdEmpresa;
      CdsTipoReceb.Post;
      CdsTipoRecebCli.Delete;
    Until Pos(sCodDesemb,Trim(CdsTipoRecebCli.FieldByName('CODTIPRECDES').AsString)) <> 1;
  End;
end;

procedure TfrmCadCliente.BtnAddTipoRecebClick(Sender: TObject);
Var
  sCodDesemb: String;
begin                                       
  inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsTipoReceb.IsEmpty) Then
  Begin
    sCodDesemb := Trim(CdsTipoReceb.FieldByName('CODTIPRECDES').AsString);
    Repeat
      CdsTipoRecebCli.Append;
      CdsTipoRecebCli.FieldByName('IDPESSOA').AsFloat      := Cds.FieldByName('IDPESSOA').AsFloat;
      CdsTipoRecebCli.FieldByName('ANASINT').AsString        := CdsTipoReceb.FieldByName('ANASINT').AsString;
      CdsTipoRecebCli.FieldByName('IDCLIXRECEB').AsFloat   := Pessoa.GetNextID;
      CdsTipoRecebCli.FieldByName('CODTIPRECDES').AsString   := CdsTipoReceb.FieldByName('CODTIPRECDES').AsString;
      CdsTipoRecebCli.FieldByName('RECPAG').asString         := 'R';
      CdsTipoRecebCli.FieldByName('IDEMPRESA').AsFloat     :=  Sistema.IdEmpresa;
      CdsTipoRecebCli.FieldByName('DESCRICAO').AsString      := CdsTipoReceb.FieldByName('DESCRICAO').AsString;
      CdsTipoRecebCli.Post;
      CdsTipoReceb.Delete;
    Until Pos(sCodDesemb,Trim(CdsTipoReceb.FieldByName('CODTIPRECDES').AsString)) <> 1;
  End;
end;

procedure TfrmCadCliente.BtnAddImpAgregClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
    (Not CdsImAgreg.IsEmpty) Then
  Begin
    CdsImAgregCli.Append;

    CdsImAgregCli.FieldByName('DESCCUSTAGREG').AsString := CdsImAgreg.FieldByName('DESCCUSTAGREG').AsString;
    CdsImAgregCli.FieldByName('CODTIPOCUSTAGREG').AsFloat := CdsImAgreg.FieldByName('CODTIPOCUSTAGREG').AsFloat;
    CdsImAgregCli.FieldByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
    CdsImAgregCli.FieldByName('RECPAG').AsString := 'R';
    CdsImAgregCli.FieldByName('IDFORCLI').AsFloat := Cds.FieldByName('IDPESSOA').AsFloat;
    CdsImAgregCli.Post;

    CdsImAgreg.Delete;
  End;
end;

procedure TfrmCadCliente.BtnDelImpAgregClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsImAgregCli.IsEmpty) Then
  Begin
    CdsImAgreg.Append;
    CdsImAgreg.FieldByName('DESCCUSTAGREG').AsString     := CdsImAgregCli.FieldByName('DESCCUSTAGREG').AsString;
    CdsImAgreg.FieldByName('CODTIPOCUSTAGREG').AsFloat := CdsImAgregCli.FieldByName('CODTIPOCUSTAGREG').AsFloat;
    CdsImAgreg.Post;
    
    CdsImAgregCli.Delete;
  End;
end;

procedure TfrmCadCliente.BtnDelTiposClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsTiposCli.IsEmpty) Then
  Begin
    CdsTipos.Append;
    CdsTipos.FieldByName('DESCRICAO').AsString    := CdsTiposCli.FieldByName('DESCRICAO').AsString;
    CdsTipos.FieldByName('IDTIPOCLIENTE').AsFloat := CdsTiposCli.FieldByName('IDTIPOCLIENTE').AsFloat;
    CdsTipos.Post;

    CdsTiposCli.Delete;
  End;
end;

procedure TfrmCadCliente.BtnAddTiposClick(Sender: TObject);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar ]) And
     (Not CdsTipos.IsEmpty) Then
  Begin
    CdsTiposCli.Append;
    CdsTiposCli.FieldByName('IDPESSOA').AsFloat      := Cds.FieldByName('IDPESSOA').AsFloat;
    CdsTiposCli.FieldByName('DESCRICAO').AsString    := CdsTipos.FieldByName('DESCRICAO').AsString;
    CdsTiposCli.FieldByName('IDTIPOCLIENTE').AsFloat := CdsTipos.FieldByName('IDTIPOCLIENTE').AsFloat;
    CdsTiposCli.Post;

    CdsTipos.Delete;
  End;
end;

procedure TfrmCadCliente.GrdTipoRecebCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If (Not (Sender as TwwDbGrid).Datasource.DataSet.IsEmpty) And
     ((Sender as TwwDbGrid).Datasource.DataSet.FieldByName('ANASINT').AsString = 'S') Then
     Begin
        ABrush.Color := $0080FFFF;
        AFont.Color  := ClNavy;
     End
     Else
     Begin
        ABrush.Color := ClWhite;
        AFont.Color  := ClBlack;
     End;
end;

procedure TfrmCadCliente.GrdTipoRecebCliCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
  If (Not (Sender as TwwDbGrid).Datasource.DataSet.IsEmpty) And
     ((Sender as TwwDbGrid).Datasource.DataSet.FieldByName('ANASINT').AsString = 'S') Then
     Begin
        ABrush.Color := $0080FFFF;
        AFont.Color  := ClNavy;
     End
     Else
     Begin
        ABrush.Color := ClWhite;
        AFont.Color  := ClBlack;
     End;
end;

procedure TfrmCadCliente.CdsSubTipoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If Sistema.TipoEmpresa = 'P' Then
     CdsSubTipo.FieldByName('CODCLIENTE').EditMask := ''
  Else
     If (Trim(ParamIntegra.MascaraCliente) = '') Then
        CdsSubTipo.FieldByName('CODCLIENTE').EditMask := 'AAAAAAAAAAAAAAAAAAAAAAAAAA-AAA;1;'
     Else
        CdsSubTipo.FieldByName('CODCLIENTE').EditMask := ParamIntegra.MascaraCliente + ';1;';
end;

procedure TfrmCadCliente.CmpCentroCustoApertouBotao(Sender: TObject);
begin
  inherited;
  CContabil.Valida;

  MsCentroCusto.Filtro.Clear;
  MsCentroCusto.Filtro.Append('CONTASXCC.IDEMPRESA = CENTCUST.IDEMPRESA');
  MsCentroCusto.Filtro.Append('CONTASXCC.CODCENTROCUSTO = CENTCUST.CODCENTROCUSTO');
  MsCentroCusto.Filtro.Append('CONTASXCC.PLANO = ' + InttoStr(ParamIntegra.Plano));
  MsCentroCusto.Filtro.Append('CONTASXCC.IDEMPRESA = '+ IntToStr(Sistema.IdEmpresa));
  MsCentroCusto.Filtro.Append('CONTASXCC.PLACONTA = ' + QuotedStr(Espaco(CContabil.Conta.Numero,18)));
end;

procedure TfrmCadCliente.CdsEmpresaClienteBeforePost(DataSet: TDataSet);
begin
  inherited;

  If (Not CdsEmpresaCliente.FieldByName('CONTACCLIENTE').IsNull) Or
     (Not CdsEmpresaCliente.FieldByName('CONTACADIANTAMENTO').IsNull) Or
     (Not CdsEmpresaCliente.FieldByName('CONTACRECEITA').IsNull) Then
     CdsEmpresaCliente.FieldByName('PLANO').AsInteger := ParamIntegra.Plano;
end;

procedure TfrmCadCliente.CdsEmpresaClienteAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CdsEmpresaCliente.FieldByName('CODCORRESPEMPRESA').EditMask := CdsSubTipo.FieldByName('CODCLIENTE').EditMask;
end;

end.


