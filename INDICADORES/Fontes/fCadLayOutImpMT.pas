{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     CADASTRO DE LAYOUT DE IMPORTAÇÃO DE INDICADORES - PLANILHAS EXCEL  ( MT )

     Módulo          :  Indicadores
     Autor           :  Marcio Motta
     Data de Início  :  19/03/2004
     Data de Término :  19/03/2004

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27596
Responsável : Daniel Simões
Data        : 14/03/2008
Descrição   : Ajuste do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fCadLayOutImpMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMTImob, StdCtrls, Mask, wwdbedit, ExtCtrls, DBCtrls, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  uCMTypes, uCtrlLayOutImp, FCadastroMT, Wwdotdot, Wwdbcomb, Wwdbspin,
  uCmSqlParams, FCadastroMestreDetMTImob, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, mIndicador, Excel_OLE;

type
  TfrmCadLayOutImpMT = class(TFrmCadastroMestreDetMTImob)
    GroupBox4: TGroupBox;
    Label1: TLabel;
    dbedtDescricao: TwwDBEdit;
    CMSqlParams1: TCMSqlParams;
    CdsIDLAYOUTIMP: TFloatField;
    CdsDESCRICAO: TStringField;
    CdsPOSINDICADOR: TFloatField;
    CdsPOSVALOR: TFloatField;
    CdsFLGPOSICAO: TStringField;
    CdsFLGTIPOINDICADOR: TStringField;
    molIndicador1: TmolIndicador;
    dbrgPosicao: TDBRadioGroup;
    CdsPOSCONTRATO: TFloatField;
    Label2: TLabel;
    dbcbPosIndicador: TwwDBComboBox;
    cdsDet: TCMClientDataSet;
    cdsDetIDLAYOUTIMP: TFloatField;
    cdsDetIDINDICADOR: TFloatField;
    cdsDetPOSINDICADOR: TFloatField;
    cdsDetDESCRICAO: TStringField;
    cdsDetDSC_COLUNA: TStringField;
    dbrgTipoIndicador: TDBRadioGroup;
    GrpDados: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dbcbColIndicador: TwwDBComboBox;
    dbcbColValor: TwwDBComboBox;
    LblColContrato: TLabel;
    dbcbColunaContrato: TwwDBComboBox;

    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure dbrgPosicaoChange(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheFind(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeDetalheCancel(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure dbcbColunaContratoChange(Sender: TObject);

  private
    ListaDetalhe : TStringList;
    CtrlLayOutImp : TCtrlLayOutImp;
    vExcel : TExcel;
    sColuna, sIndicador : string;

    function VerificaPreenchimento : Boolean;
    function VerificaPreenchimentoDetalhe : Boolean;
    procedure HabilitaColunaLinha;
    procedure SelecionaMestreDetalhe(const iId : Integer);
    procedure PreencheListaDetalhe;
    procedure ExcluirItensLista(const Indicador, Posicao : string);


  public
    { Public declarations }

  end;

var
  frmCadLayOutImpMT: TfrmCadLayOutImpMT;

implementation

uses dBaseDados, uSistema, uMensErro, uComunsImobiliario, uVerificaPreenchimento;

{$R *.DFM}

procedure TfrmCadLayOutImpMT.FormCreate(Sender: TObject);
begin
  inherited;
  // Cria e inicializa o CtrlObject do objeto de LayOut de Importação
  CtrlLayOutImp := TCtrlLayOutImp.Create;
  CtrlLayOutImp.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                           ComunsImobiliario.MensErroMT);

  // Associa o Cds do CtrlObject ao Cds local para as alterações locais refletirem
  // no CtrlObject
  CtrlLayOutImp.CdsLayOutImp    := Cds;
  CtrlLayOutImp.CdsDetLayOutImp := CdsDet;
  CdsDet.CreateDataSet;

  // Cria a Lista para controle de registros do CDS
  ListaDetalhe := TStringList.Create;

  // Cria a classe EXCEL para utilizar a função de Busca Letra da Coluna
  vExcel := TExcel.Create;
end;

procedure TfrmCadLayOutImpMT.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ListaDetalhe);
  FreeAndNil(CtrlLayOutImp);
  FreeAndNil(vExcel);
  inherited;
end;

procedure TfrmCadLayOutImpMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  // carrega o pacote de dados do Cds local com os valores retornados do CtrlObject
  if MontaSelect.RetornouValor then
    SelecionaMestreDetalhe(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadLayOutImpMT.CmeCadastroInsert(Sender: TObject);
begin
  // Limpa TODOS os Cds para um novo registro, -2 abre grid em branco quando entra no modo de inserção
  SelecionaMestreDetalhe(-2);
  ListaDetalhe.Clear;

  inherited;

  CdsFLGPOSICAO.AsString := 'C';
  dbedtDescricao.SetFocus;
  dbcbColIndicador.ItemIndex := -1;
  dbcbColValor.ItemIndex := -1;
end;

procedure TfrmCadLayOutImpMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedtDescricao.SetFocus;
end;

procedure TfrmCadLayOutImpMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlLayOutImp.GravaLayOutImp;
  if dbedtDescricao.CanFocus then dbedtDescricao.SetFocus;

  // Apaga o conteúdo da lista ao final da inclusão
  ListaDetalhe.Clear;
end;

procedure TfrmCadLayOutImpMT.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := CtrlLayOutImp.ExcluiLayOutImp;
  if dbedtDescricao.CanFocus then dbedtDescricao.SetFocus;
end;

procedure TfrmCadLayOutImpMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := VerificaPreenchimento;
end;

function TfrmCadLayOutImpMT.VerificaPreenchimento: Boolean;
begin
  Result := False;
  try
     // Verifica o preenchimento da Descrição
     if dbedtDescricao.Text = '' then
       raise EValidacao.CreateVal('Informe o Descrição do Layout de importação',dbedtDescricao);

     // Se Layout por LINHA
     if CdsFLGPOSICAO.AsString = 'L' then
       begin
         if (dbcbColIndicador.Text = '') then
           raise EValidacao.CreateVal('Informe a coluna do indicador na planilha para a importação',dbcbColIndicador);

         if (dbcbColValor.Text = '') then
           raise EValidacao.CreateVal('Informe a coluna do valor na planilha para a importação',dbcbColValor);

         if not cdsDet.IsEmpty then
           raise EValidacao.CreateVal('Para importação por Linha não informar Indicadores e Colunas.',dbedtDescricao);

       end;

     // Se Layout por COLUNA
     if CdsFLGPOSICAO.AsString = 'C' then
       begin
         if not cdsDet.IsEmpty then begin
           while not cdsDet.Eof do begin
             if (cdsDetDSC_COLUNA.AsString = dbcbColunaContrato.Text) then
               raise EValidacao.CreateVal('A coluna informada para contrato está armazenando Indicador.',dbcbPosIndicador);
             cdsDet.Next;
           end;
         end;

         if CdsPOSCONTRATO.AsString = '' then
           raise EValidacao.CreateVal('Informe a coluna do número do contrato',dbcbColValor);

         if cdsDet.IsEmpty then
           raise EValidacao.CreateVal('É necessário a informação de pelo menos um Indicador.',dbedtDescricao);
       end;
  except
     on ev : EValidacao do begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;
  end;

  Result := True;
end;

procedure TfrmCadLayOutImpMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  // Recarrega o registro após a edição ( bug do padrão )
  if cmeCadastro.Operacao = opAlterar then
     Cds.Data := CtrlLayOutImp.LookUpLayOutImp( CdsIDLAYOUTIMP.AsInteger );
end;


procedure TfrmCadLayOutImpMT.dbrgPosicaoChange(Sender: TObject);
begin
  inherited;
  HabilitaColunaLinha;
end;

procedure TfrmCadLayOutImpMT.HabilitaColunaLinha;
begin
  if dbrgPosicao.ItemIndex = -1 then
    begin
      // Não existe ESCOLHA
      GrpDados.Visible := False;
      dbrgTipoIndicador.Visible := False;
      dbcbColunaContrato.Visible := False;
      LblColContrato.Visible := False;
      tb97BotoesDetalhe.enabled := False;
      if cds.State in dsEditModes then
        begin
          cdsFLGTIPOINDICADOR.Clear;
          CdsPOSCONTRATO.Clear;
        end;
    end;

  if dbrgPosicao.ItemIndex = 0 then
    begin
      // Escolheu COLUNA
      GrpDados.Visible := False;
      dbrgTipoIndicador.Visible := False;
      dbcbColunaContrato.Visible := True;
      LblColContrato.Visible := True;
      tb97BotoesDetalhe.enabled := False;
      sbtnInsDet.Enabled := True;
      if cds.State in dsEditModes then
        CdsFLGTIPOINDICADOR.AsString := 'C';
    end;

  if dbrgPosicao.ItemIndex = 1 then
    begin
      // Escolheu LINHA
      GrpDados.Visible := True;
      dbrgTipoIndicador.Visible := True;
      dbcbColunaContrato.Visible := False;
      LblColContrato.Visible := False;
      tb97BotoesDetalhe.enabled := False;
      sbtnInsDet.Enabled := False;
      if cds.State in dsEditModes then
        begin
          CdsFLGTIPOINDICADOR.Clear;
          CdsPOSCONTRATO.Clear;
        end;
    end;
end;

procedure TfrmCadLayOutImpMT.CmeDetalheConfirma(Sender: TObject);
var
  iItemIndicador, iItemPosicao : integer;

begin
  if cdsDet.State in dsEditModes then begin
    if VerificaPreenchimentoDetalhe then begin
      // Se a variável possuir conteúdo, é porque o registro está sendo editado,
      // pois ela é preenchida no evento de edição
      if sColuna <> '' then begin
        ExcluirItensLista(sIndicador,sColuna);
      end;

      // Faz a busca dos índices para verificar se existem na lista
      iItemIndicador := ListaDetalhe.IndexOf(FloatToStr(molIndicador1.iIndicador));
      iItemPosicao   := ListaDetalhe.IndexOf(dbcbPosIndicador.Text);

      // Se não existirem na lista, faz a inclusão do registro no banco e na lista
      if (iItemIndicador = -1) and (iItemPosicao = -1) then begin

        // Inclui o registro no CDS
        cdsDetIDINDICADOR.AsFloat := molIndicador1.iIndicador;
        cdsDetDESCRICAO.AsString  := molIndicador1.sIndicador;
        cdsDetDSC_COLUNA.AsString := vExcel.LetraColuna(cdsDetPOSINDICADOR.AsInteger);

        // Inclui o registro na lista
        ListaDetalhe.Add(IntToStr(molIndicador1.iIndicador));
        ListaDetalhe.Add(dbcbPosIndicador.Text);

        // Limpa as variáveis do MOL
        molIndicador1.btnLimpaIndicadorClick(Self);

        // Apaga o conteúdos das variáveis globais
        sColuna    := '';
        sIndicador := '';

        inherited;

      end else begin
        // Se já existirem na lista, gera exceção e avisa ao usuário
        if (iItemIndicador > -1) then begin
          MsgDlg('Indicador já Informado neste Layout.','Aviso',mtWarning,[mbOk],0);
          ListaDetalhe.Add(sIndicador);
          ListaDetalhe.Add(sColuna);
          EXIT;
        end;
        if (iItemPosicao > -1) then begin
          MsgDlg('Coluna já utilizada por outro indicador neste Layout','Aviso',mtWarning,[mbOk],0);
          ListaDetalhe.Add(sIndicador);
          ListaDetalhe.Add(sColuna);
          EXIT;
        end;
      end;
    end;
  end;
end;

procedure TfrmCadLayOutImpMT.SelecionaMestreDetalhe(const iId: Integer);
begin
  // Busca registros no banco
  cds.Data    := CtrlLayOutImp.LookupLayOutImp(iId);
  cdsDet.Data := CtrlLayOutImp.LookupDetLayOutImp(iId);

  // Preenche a Lista para controle de registros duplicados no CDS
  PreencheListaDetalhe;
end;

procedure TfrmCadLayOutImpMT.CmeDetalheFind(Sender: TObject);
begin
  inherited;
  // Preenche variáveis do MOL com registro do CDS na procura
  molIndicador1.iIndicador := cdsDetIDINDICADOR.AsInteger;
  molIndicador1.sIndicador := cdsDetDESCRICAO.AsString;
end;

procedure TfrmCadLayOutImpMT.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  // Após a deleção do registro, limpa os dados
  SelecionaMestreDetalhe(-2);
end;

function TfrmCadLayOutImpMT.VerificaPreenchimentoDetalhe: Boolean;
begin
  // Rotina para verificar o correto preenchimento do registro Detalhe
  Result := False;
  try
    if molIndicador1.edtIndicador.Text = '' then
      raise EValidacao.CreateVal('Informe o Indicador.',molIndicador1.edtIndicador);

    if dbcbPosIndicador.ItemIndex = -1 then
      raise EValidacao.CreateVal('Informe a coluna do Indicador.',dbcbPosIndicador);

    if dbcbPosIndicador.Text = dbcbColunaContrato.Text then
      raise EValidacao.CreateVal('A coluna informada já está armazenando o contrato.',dbcbPosIndicador);

  except
    on ev : EValidacao do
      begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
      end;
  end;
  Result := True;
end;

procedure TfrmCadLayOutImpMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // Se cancelar o processo de cadastro mestre, limpa a lista de controle
  ListaDetalhe.Clear;
end;

procedure TfrmCadLayOutImpMT.CmeDetalheCancel(Sender: TObject);
begin
  inherited;
  // Se cancelar o processo de cadastro detalhe, limpa a lista de controle
  ListaDetalhe.Clear;
end;

procedure TfrmCadLayOutImpMT.PreencheListaDetalhe;
begin
  // Rotina para preencher a lista de controle com dados existentes no CDS
  if not cdsDet.IsEmpty then begin
    while not cdsDet.Eof do begin
      ListaDetalhe.Add(IntToStr(cdsDetIDINDICADOR.AsInteger));
      ListaDetalhe.Add(vExcel.LetraColuna(cdsDetPOSINDICADOR.AsInteger));
      cdsDet.Next;
    end;
  end;
end;

procedure TfrmCadLayOutImpMT.ExcluirItensLista(const Indicador, Posicao : string);
var
  i : integer;
begin
  // Existindo o item Indicador, verifica o índice e o deleta da lista
  if ListaDetalhe.IndexOf(Indicador) > -1 then begin
    i := ListaDetalhe.IndexOf(Indicador);
    ListaDetalhe.Delete(i);
  end;
  // Existindo o item Posicao, verifica o índice e o deleta da lista
  if ListaDetalhe.IndexOf(Posicao) > -1 then begin
    i := ListaDetalhe.IndexOf(Posicao);
    ListaDetalhe.Delete(i);
  end;
end;

procedure TfrmCadLayOutImpMT.CmeDetalheDelete(Sender: TObject);
begin
  inherited;
  // Exclui os itens da lista, caso sejam excluídos do CDS
  ExcluirItensLista(IntToStr(cdsDetIDINDICADOR.AsInteger),vExcel.LetraColuna(cdsDetPOSINDICADOR.AsInteger));
end;

procedure TfrmCadLayOutImpMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  // Se o registro entrar em edição, preenche as variáveis globais
  sColuna    := cdsDetDSC_COLUNA.AsString;
  sIndicador := IntToStr(cdsDetIDINDICADOR.AsInteger);
  // Preenche as variáveis do MOL para a edição
  molIndicador1.edtIndicador.Text := cdsDetDESCRICAO.AsString;
  molIndicador1.iIndicador := cdsDetIDINDICADOR.AsInteger;
  molIndicador1.sIndicador := cdsDetDESCRICAO.AsString;
end;

procedure TfrmCadLayOutImpMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  // Limpa as variáveis do MOL
  molIndicador1.btnLimpaIndicadorClick(Self);
end;

procedure TfrmCadLayOutImpMT.dbcbColunaContratoChange(Sender: TObject);
begin
  inherited;
  try
    if not cdsDet.IsEmpty then begin
      while not cdsDet.Eof do begin
        if (cdsDetDSC_COLUNA.AsString = dbcbColunaContrato.Text) then
          raise EValidacao.CreateVal('A coluna informada para contrato está armazenando Indicador.',dbcbPosIndicador);
        cdsDet.Next;
      end;
    end;
  except
    on ev : EValidacao do
      begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
      end;
  end;
end;

end.
