// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
//RESPONSÁVEL.: Marcio Sanches Spinosa
//Nº SOL......: 149111
//Nº KINTANA..: 1066131
//Data........: 09/01/2013
//Descrição...: Alteração no escopo do relatório, tratamento para substituição
// em tempo de execução das testemunhas e representante entre outros.
//------------------------------------------------------------------------------

unit fParamCartaComunicado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls, MontaSelect,
  wwdblook, fSairAjuda, uCMClientDataSet, uCtrlCartaComunicado, uCtrlPadroes;

const
  // Modelos da Tela de Parâmetros
  CARTA_NORMAL = 0;
  CARTA_SOLIC = 1;
  CARTA_EFETIV_SOLIC = 2;
  CARTA_SEM_SEL = 3;

type
  TfrmParamCartaComunicado = class(TfrmSairAjuda)
    rgSelecao: TRadioGroup;
    gbxNome: TGroupBox;
    rgNossoNome: TRadioGroup;
    rgNomeEnd: TRadioGroup;
    sbtnProcurar: TSpeedButton;
    memNome: TMemo;
    MontaSelect: TMontaSelect;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    pnl1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbbRepresentante: TComboBox;
    cbbTestemunha1: TComboBox;
    cbbTestemunha2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure rgSelecaoClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    procedure HabilitaBtOk;
  public
    IdPessoa: string;
    // Tipo do Layout do Formulário (com ou sem a Seleção da Carta e das pessoas)
    TipoParam: byte;
    // Número da carta a ser impressa
    NumCarta: string;
    CtrlCarta : TCtrlCartaComunicado; //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
    procedure ImprimirCarta;
    procedure CarregarEmpregadosAtivos; //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
  end;

var
  frmParamCartaComunicado: TfrmParamCartaComunicado;

implementation

uses uSistema, uCtrlFuncoesRH, fParamCartaComunicadoAux, RCartaComunicado, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamCartaComunicado.FormCreate(Sender: TObject);
begin
  inherited;
  RptCartaComunicado := TRptCartaComunicado.Create(Application);

  TipoParam := CARTA_NORMAL;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    // Usuário RH
    if not(CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDEMPRESA(+) = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA(+)  = PESSOA.IDPESSOA');
  end;

  CtrlCarta := TCtrlCartaComunicado.Create;
  CtrlCarta.InitializeAs(Padroes);

  CarregarEmpregadosAtivos; //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
end;

procedure TfrmParamCartaComunicado.FormDestroy(Sender: TObject);
begin
  FreeAndNil(RptCartaComunicado);
  FreeAndNil(CtrlCarta);//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131

  inherited;
end;

procedure TfrmParamCartaComunicado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (TipoParam <> CARTA_NORMAL) then
    Action := caHide;
end;

// Muda o Layout do Formulário para impressão com ou sem a Seleção da Carta e das pessoas
procedure TfrmParamCartaComunicado.FormShow(Sender: TObject);
begin
  inherited;
  gbxNome.Visible := (TipoParam = CARTA_NORMAL);
  rgSelecao.Visible := (TipoParam <> CARTA_SEM_SEL);

  case (TipoParam) of
    CARTA_NORMAL :
    begin
      rgSelecao.Caption := 'Endereçar a';
      rgSelecao.Width := 152;
      rgSelecao.Height := 58;
      rgSelecao.Columns := 1;
      rgSelecao.Items.Clear;
      rgSelecao.Items.Add('Uma só Pessoa');
      rgSelecao.Items.Add('Pessoas a Selecionar');
      rgSelecao.ItemIndex := 1;

      rgNossoNome.Top := 69;
      rgNomeEnd.Top := 111;
      rgNomeEnd.Height := 64;
//      Self.Height := 252; //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
    end;
    CARTA_SOLIC, CARTA_EFETIV_SOLIC :
    begin
      if (TipoParam = CARTA_SOLIC) then
        rgSelecao.Caption := 'Forma de Impressão'
      else
        rgSelecao.Caption := 'Critério de Efetivação';

      rgSelecao.Width := 400;
      rgSelecao.Height := 50;
      rgSelecao.Columns := 2;
      rgSelecao.Items.Clear;
      rgSelecao.Items.Add('Pessoa Indicada');
      rgSelecao.Items.Add('Todas');
      rgSelecao.ItemIndex := 0;

      rgNossoNome.Top := 63;
      rgNomeEnd.Top := 63;
      rgNomeEnd.Height := rgNossoNome.Height;
//      Self.Height := 243;//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
    end;
    CARTA_SEM_SEL :
    begin
      rgSelecao.ItemIndex := 0;
      rgNossoNome.Top := 7;
      rgNomeEnd.Top := 7;
      rgNomeEnd.Height := rgNossoNome.Height;
//      Self.Height := 178; //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
    end;
  end;

  rgSelecaoClick(Sender);
end;

procedure TfrmParamCartaComunicado.rgSelecaoClick(Sender: TObject);
begin
  if (TipoParam = CARTA_NORMAL) then
    gbxNome.Visible := (rgSelecao.ItemIndex <> 1);
  HabilitaBtOk;
end;

procedure TfrmParamCartaComunicado.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.RetornouValor) then
  begin
    IdPessoa := MontaSelect.ValoresChave[0];
    memNome.Text := MontaSelect.ValoresChave[1];
  end
  else
  begin
    IdPessoa := '';
    memNome.Text := '';
  end;

  sbtnProcurar.Down := false;
  HabilitaBtOk;
end;

procedure TfrmParamCartaComunicado.bbtnConfirmarClick(Sender: TObject);
var
  bOk: boolean;
  pStrLista : string;//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
begin
  pStrLista := ''; //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
  with (RptCartaComunicado) do
  begin
    LocalNossoNome := rgNossoNome.ItemIndex;
    ImprimeNomeEnd := rgNomeEnd.ItemIndex;

    if (rgSelecao.ItemIndex = 1) and not(TipoParam in [CARTA_SOLIC, CARTA_EFETIV_SOLIC]) then
    begin
      with TfrmParamCartaComunicadoAux.Create(Application) do
      begin
        bOk := (ShowModal = mrOk);
        if (bOk) then
          ListaIdPessoaSel := IdPessoaSel;
          pStrLista := ListaIdPessoaSel;//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
          if (ListaIdPessoaSel <> '-1') then
            Free;
      end;
    end
    else
    begin
      bOk := true;
      ListaIdPessoaSel := IdPessoa;
      pStrLista := ListaIdPessoaSel;
    end;
  end;

  if (bOk) and not(TipoParam in [CARTA_SOLIC, CARTA_EFETIV_SOLIC]) and (pStrLista <> '-1') then  //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131
    ImprimirCarta;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmParamCartaComunicado.HabilitaBtOk;
begin
  bbtnConfirmar.Enabled := (TipoParam <> CARTA_NORMAL) or ((rgSelecao.ItemIndex = 1) or
    ((rgSelecao.ItemIndex = 0) and (Trim(memNome.Text) <> '')));
end;

procedure TfrmParamCartaComunicado.ImprimirCarta;
begin
  RptCartaComunicado.NumCarta := NumCarta;
  RptCartaComunicado.CrmRptCM.IdReports := 3836;
  RptCartaComunicado.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  RptCartaComunicado.CrmRptCM.OrigemCM := 1;
  RptCartaComunicado.CrmRptCM.IdModulo := Sistema.IdModulo;
  RptCartaComunicado.CrmRptCM.IdUsuario := Sistema.IdUsuario;

  //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Inicio
  if (cbbRepresentante.ItemIndex > -1) then
     RptCartaComunicado.pIntIDRepresentante := LongInt(cbbRepresentante.Items.Objects[cbbRepresentante.ItemIndex]);

  if (cbbTestemunha1.ItemIndex > -1) then
     RptCartaComunicado.pIntIDTestemunha1   := longInt(cbbTestemunha1.Items.Objects[cbbTestemunha1.ItemIndex]);

  if (cbbTestemunha2.ItemIndex > -1) then
     RptCartaComunicado.pIntIDTestemunha2   := LongInt(cbbTestemunha2.Items.Objects[cbbTestemunha2.ItemIndex]);
  //Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Fim
  RptCartaComunicado.CrmRptCM.Print;
end;

//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - Inicio
procedure TfrmParamCartaComunicado.CarregarEmpregadosAtivos;
  var CdsFuncionarios : tCMClientDataSet;
begin
  try
     CdsFuncionarios := TCMClientDataSet.Create(nil);
     CdsFuncionarios.Data := CtrlCarta.CarregarEmpregadosAtivos;

     CdsFuncionarios.First;
     while not CdsFuncionarios.Eof do
     begin
       cbbRepresentante.Items.AddObject(CdsFuncionarios.FieldByName('NOME').AsString,
                                        Pointer(CdsFuncionarios.FieldByName('IDPESSOA').AsInteger));
       cbbTestemunha1.Items.AddObject(CdsFuncionarios.FieldByName('NOME').AsString,
                                        Pointer(CdsFuncionarios.FieldByName('IDPESSOA').AsInteger));
       cbbTestemunha2.Items.AddObject(CdsFuncionarios.FieldByName('NOME').AsString,
                                        Pointer(CdsFuncionarios.FieldByName('IDPESSOA').AsInteger));

       CdsFuncionarios.Next;

     end;
  finally
    FreeAndNil(CdsFuncionarios);
  end;
end;
//Marcio Sanches Spinosa SOL: 149111 Nº KINTANA: 1066131 - fim

end.
