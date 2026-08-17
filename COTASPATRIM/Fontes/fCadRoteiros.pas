unit fCadRoteiros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdbedit, Wwdbspin,
  wwdblook, wwdbdatetimepicker, CMDateTimePicker, Mask, DBCtrls, usistema,
  uCmSqlParams, CMDBLookupCombo, uCtrlRoteiros, uCtrlPadroes, uCMTypes,
  uMensErro, dBaseDados, uCtrlAtivo;

type
  TfrmCadRoteiros = class(TFrmCadastroMestreDetMT)
    lblNome: TLabel;
    dbNome: TDBEdit;
    lblDescricao: TLabel;
    lblVigenciaInicio: TLabel;
    lblVigenciaFim: TLabel;
    dbtpVigenciaInicio: TCMDateTimePicker;
    dbtpVigenciaFim: TCMDateTimePicker;
    tbsEntradas: TTabSheet;
    tabMovimentacoes: TTabSheet;
    Panel1: TPanel;
    dbgrEntrada: TwwDBGrid;
    dbgrMovimentacao: TwwDBGrid;
    Panel2: TPanel;
    CdsEntrada: TCMClientDataSet;
    dsEntrada: TwwDataSource;
    cdsMovimentacao: TCMClientDataSet;
    dsMovimentacao: TwwDataSource;
    dbMmDescricao: TDBMemo;
    dbrgBaseado: TDBRadioGroup;
    dblkTpEntrada: TCMDBLookupCombo;
    lblTpEntrada: TLabel;
    dblkMovimentacao: TCMDBLookupCombo;
    dblkConta: TCMDBLookupCombo;
    lblMovimenta: TLabel;
    lblConta: TLabel;
    CdsLkRegra: TCMClientDataSet;
    CdslkConta: TCMClientDataSet;
    Cdslkmovim: TCMClientDataSet;
    CdsLkEntrada: TCMClientDataSet;
    dbchkAtivo: TDBCheckBox;
    dbrgrpOrigemMov: TDBRadioGroup;
    pnlRegra: TPanel;
    lblRegraCalculo: TLabel;
    dblkRegraCalculo: TCMDBLookupCombo;
    pnlEntrada: TPanel;
    Label1: TLabel;
    dblkpEntrada: TCMDBLookupCombo;
    pnlDadosContas: TPanel;
    lblDesembReceb: TLabel;
    dbrgOperacao: TDBRadioGroup;
    pnlDadosContasEnt: TPanel;
    pnlRecebDesemb: TPanel;
    dbrgrpOrigemEnt: TDBRadioGroup;
    CdsAtivo: TCMClientDataSet;
    Label3: TLabel;
    cmlkpAtivo: TCMDBLookupCombo;
    cdsAlterador: TCMClientDataSet;
    pnlAlterador: TPanel;
    lblalterador: TLabel;
    dblkAlterador: TCMDBLookupCombo;
    btnAtualizarListas: TBitBtn;
    edtRecDesPrinc: TEdit;
    btnRecDesPrinc: TSpeedButton;
    msRecDes: TMontaSelect;
    btnEntRecDes: TSpeedButton;
    Label2: TLabel;
    edtEntRecDes: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CdsEntradaAfterPost(DataSet: TDataSet);
    procedure CdsEntradaAfterDelete(DataSet: TDataSet);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure cdsMovimentacaoAfterInsert(DataSet: TDataSet);
    procedure cdsMovimentacaoBeforePost(DataSet: TDataSet);
    procedure cdsMovimentacaoAfterScroll(DataSet: TDataSet);
    procedure dbrgrpOrigemMovClick(Sender: TObject);
    procedure dbrgrpOrigemEntClick(Sender: TObject);
    procedure CdsEntradaAfterScroll(DataSet: TDataSet);
    procedure CdsEntradaAfterInsert(DataSet: TDataSet);
    procedure CdsEntradaBeforePost(DataSet: TDataSet);
    procedure dbrgBaseadoClick(Sender: TObject);
    procedure CdsAfterOpen(DataSet: TDataSet);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CdsBeforePost(DataSet: TDataSet);
    procedure cmlkpAtivoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cdsMovimentacaoAfterPost(DataSet: TDataSet);
    procedure cdsMovimentacaoAfterDelete(DataSet: TDataSet);
    procedure dbrgOperacaoClick(Sender: TObject);
    procedure dblkMovimentacaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnAtualizarListasClick(Sender: TObject);
    procedure btnRecDesPrincClick(Sender: TObject);
    procedure CdsAfterClose(DataSet: TDataSet);
    procedure CdsAfterDelete(DataSet: TDataSet);
    procedure CdsAfterInsert(DataSet: TDataSet);
    procedure btnEntRecDesClick(Sender: TObject);
  private
    iIdCpRoteiro : integer;

    function Salva : boolean;
    procedure Seleciona( iId : integer );
    procedure SelecionaOrigemMov;
    procedure SelecionaOrigemEnt;

    procedure CarregarListas;

    procedure DadosOrigem;
  public
    CtrlRoteiros : TCtrlRoteiro;
    CtrlAtivo    : TCtrlAtivo;

    procedure MsgErro( sMsg : string );
    procedure SelecionaAtivo;
  end;

var
  frmCadRoteiros: TfrmCadRoteiros;

implementation

{$R *.DFM}

procedure TfrmCadRoteiros.FormCreate(Sender: TObject);
begin
  inherited;
  //Cria a classe e carrega o CDS
  CtrlRoteiros:=TCtrlRoteiro.Create;
  CtrlRoteiros.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro ); 
  CtrlRoteiros._CdsPrin:=Cds;
  CtrlRoteiros._CdsDetEnt:= CdsEntrada;
  CtrlRoteiros._CdsDetMov:= CdsMovimentacao;

  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs( CtrlRoteiros );

  //Atualiza Botoes o Idle carrega quando está vazio.
  CmeCadastro.Operacao := opIdle;
  CmeCadastro.AtualizaBotoes(Self);

  //Carrega combos
  CarregarListas;

  //Carrega as tabelas de Destino
  cds.data               := CtrlRoteiros.CarregaRoteiro(-1);
  CdsEntrada.Data        := CtrlRoteiros.CarregaCpREntrada(-1);
  cdsMovimentacao.Data   := CtrlRoteiros.CarregaCpRTpMovim(-1);
  CdsAtivo.Data          := CtrlAtivo.CarregaAtivo;

  iIdCpRoteiro := 0;
end;


procedure TfrmCadRoteiros.FormDestroy(Sender: TObject);
begin
  CtrlRoteiros.Free;
  CtrlAtivo.Free;
  inherited;
end;


function TfrmCadRoteiros.Salva : boolean;
begin
  Result := CtrlRoteiros.GravaDados;
  if Result then
    Seleciona( iIdCpRoteiro )
  else
    MsgDlg( CtrlRoteiros.MessageInfo, 'Atenção', mtError, [MbOk], 0 );
end;

procedure TfrmCadRoteiros.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadRoteiros.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := Salva;
end;

procedure TfrmCadRoteiros.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := False;

  if dbNome.Text = '' then
  begin
    MsgDlg('O nome deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbNome.SetFocus;
    exit;
  end;

  if cmlkpAtivo.Text = '' then
  begin
    MsgDlg( 'O ativo deve ser informado.', 'Atenção', mtWarning, [mbOk], 0 );
    cmlkpAtivo.SetFocus;
    exit;
  end;

  if dbtpVigenciaInicio.Text = '' then
  begin
    MsgDlg('O início da vigência deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbtpVigenciaInicio.SetFocus;
    exit;
  end;

  if dbtpVigenciaFim.Text <> '' then
  begin
    if dbtpVigenciaInicio.Date > dbtpVigenciaFim.Date then
    begin
      MsgDlg('Data final anterior à data inicial.', 'Atenção', mtWarning, [mbOk], 0);
      dbtpVigenciaFim.SetFocus;
      exit;
    end;
  end;

  if ( dbrgBaseado.ItemIndex > 0 ) and ( trim( edtRecDesPrinc.Text ) = '' ) then
  begin
    MsgDlg('O recebimento/desembolso principal deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    tbcDetalhe.TabIndex := 0;
    tbcDetalheChange( tbcDetalhe );
    pgctrlDetalhe.ActivePage := tbsDet;
    exit;
  end;

  if not CtrlRoteiros.VerificaRoteiro( Cds.FieldByName('IDCPROTEIRO').AsInteger, dbNome.Text ) then
  begin
    MsgDlg('Nome já cadastrado', 'Atenção', mtError, [MbOk], 0);
    dbNome.SetFocus;
    exit;
  end;

  Accept := True;
end;


procedure TfrmCadRoteiros.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  cdsEntrada.Data        := CtrlRoteiros.CarregaCpREntrada( -1 );
  cdsMovimentacao.Data   := CtrlRoteiros.CarregaCpRTpMovim( -1 );

  iIdCpRoteiro := 0;

  cds.FieldByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
  cds.FieldByName('FLGORIGEM').AsString   := 'N';
  cds.FieldByName('FLGOPERACAO').AsString := 'D';
  cds.FieldByName('FLGATIVO').AsString    := 'S';

  DadosOrigem;

  dbrgBaseado.Enabled  := True;
  dbrgOperacao.Enabled := True;
  cmlkpAtivo.Enabled   := True;

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange( tbcDetalhe );
  pgctrlDetalhe.ActivePage := tbsDet;

  SelecionaAtivo;

  if dbNome.CanFocus then dbNome.SetFocus;
end;


procedure TfrmCadRoteiros.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    iIdCpRoteiro := StrToInt( MontaSelect.ValoresChave[0] );
    Seleciona( iIdCpRoteiro );
  end;
end;

procedure TfrmCadRoteiros.Seleciona(iId: integer);
begin
  bbtnCancelarDet.Click;

  Cds.Data := CtrlRoteiros.CarregaRoteiro( iId );

  SelecionaAtivo;

  CdsEntrada.Data := CtrlRoteiros.CarregaCpREntrada( iId );
  cdsMovimentacao.Data:= CtrlRoteiros.CarregaCpRTpMovim( iId );

  tbcDetalhe.TabIndex := 0;
  tbcDetalheChange( tbcDetalhe );
  pgctrlDetalhe.ActivePage := tbsDet;  

  dbrgBaseado.Enabled  := CdsEntrada.IsEmpty;
  dbrgOperacao.Enabled := CdsEntrada.IsEmpty;
  cmlkpAtivo.Enabled   := cdsMovimentacao.IsEmpty;

  edtRecDesPrinc.Clear;
  if trim( cds.FieldByname('CODTIPRECDES').AsString ) <> '' then
  begin
    edtRecDesPrinc.Text := cds.FieldByname('CODTIPRECDES').AsString + ' (' +
     cds.FieldByname('RECPAG').AsString + ') - ' +
     CtrlRoteiros.DescDesembReceb( cds.FieldByname('CODTIPRECDES').AsString, cds.FieldByname('RECPAG').AsString );
  end;
end;

procedure TfrmCadRoteiros.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  CdsEntrada.First;
  while not CdsEntrada.Eof do
    CdsEntrada.Delete;

  cdsMovimentacao.First;
  while not cdsMovimentacao.Eof  do
    cdsMovimentacao.Delete;

  Accept := CtrlRoteiros.ExcluiDados;
  if Accept then
    iIdCpRoteiro := 0
  else
    MsgDlg( CtrlRoteiros.MessageInfo, 'Atenção', mtError, [MbOk], 0 );
end;


procedure TfrmCadRoteiros.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Seleciona( iIdCpRoteiro );
end;

procedure TfrmCadRoteiros.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  if CdsEntrada.State = dsInsert then
    CdsEntrada.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
end;


procedure TfrmCadRoteiros.CmeDetalheConfirma(Sender: TObject);
begin
  case pgctrlDetalhe.ActivePageIndex of

    //Entradas
    1 : begin
          if CdsEntrada.IsEmpty then exit;
          if not ( CdsEntrada.State in [dsInsert] ) then CdsEntrada.Edit;
          CdsEntrada.FieldByName('NOME_ENTRADA').AsString      := dblkTpEntrada.Text;
          CdsEntrada.FieldByName('TIPOUNIDADE').AsString       := CdsLkEntrada.FieldByName('TIPOUNIDADE').AsString;
          if CdsEntrada.FieldByName('FLGORIGEM').AsString = 'R' then
          begin
            CdsEntrada.FieldByName('NOME_RECEB').AsString      := edtEntRecDes.Text;
            CdsEntrada.FieldByName('NOME_ALTERADOR').AsString  := '';
            CdsEntrada.FieldByName('CODALTERADOR').Clear;
          end
          else
          if CdsEntrada.FieldByName('FLGORIGEM').AsString = 'A' then
          begin
            CdsEntrada.FieldByName('NOME_RECEB').AsString      := '';
            CdsEntrada.FieldByName('CODTIPRECDES').Clear;
            CdsEntrada.FieldByName('NOME_ALTERADOR').AsString  := dblkAlterador.Text;
          end
          else
          begin
            CdsEntrada.FieldByName('NOME_RECEB').AsString      := '';
            CdsEntrada.FieldByName('CODTIPRECDES').Clear;
            CdsEntrada.FieldByName('NOME_ALTERADOR').AsString  := '';
            CdsEntrada.FieldByName('CODALTERADOR').Clear;       
          end;
        end;                                             



     //Movimentações
     2: begin
          if cdsMovimentacao.IsEmpty then exit;
          if not ( cdsMovimentacao.State in [dsInsert] ) then cdsMovimentacao.Edit;
          if ( Cdslkmovim.FieldByName('FLGTPMOVIM').AsString <> 'T' ) and ( Cdslkmovim.FieldByName('FLGTPMOVIM').AsString <> 'C' ) then
          begin
            cdsMovimentacao.FieldByName('IDCPCONTA').Clear;
            cdsMovimentacao.FieldByName('NOME_CONTA').Clear;
          end
          else
          begin
            cdsMovimentacao.FieldByName('NOME_CONTA').AsString       := dblkConta.Text;
          end;
          cdsMovimentacao.FieldByName('NOME').AsString     := dblkMovimentacao.Text;
          if cdsMovimentacao.FieldByName('FLGORIGEM').AsString = 'E' then
          begin
            cdsMovimentacao.FieldByName('IDREGRA').Clear;
            cdsMovimentacao.FieldByName('NOME_ENTRADA').AsString     := dblkpEntrada.Text;
            cdsMovimentacao.FieldByName('NOME_REGRA').AsString       := '';
          end
          else
          begin
            cdsMovimentacao.FieldByName('IDCPTPENTRADA').Clear;
            cdsMovimentacao.FieldByName('NOME_ENTRADA').AsString     := '';
            cdsMovimentacao.FieldByName('NOME_REGRA').AsString       := dblkRegraCalculo.Text;
          end;
        end;
  end;
  inherited;
end;

procedure TfrmCadRoteiros.CmeDetalheBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  case pgctrlDetalhe.ActivePageIndex of

    //Entradas
    1 : begin
          if dblkTpEntrada.Text = '' then
          begin
            MsgDlg('O tipo de entrada deve ser preenchido.', 'Atenção', mtError, [mbOK], 0);
            Accept := False;
            exit;
          end;

          if dbrgBaseado.ItemIndex > 0 then
          begin
            if dbrgrpOrigemEnt.ItemIndex = 0 then
            begin
              if trim( edtEntRecDes.Text ) = '' then
              begin
                MsgDlg('O recebimento/desembolso deve ser preenchido.', 'Atenção', mtError, [mbOK], 0);
                Accept := False;
                exit;
              end;
            end;

            if dbrgrpOrigemEnt.ItemIndex = 1 then
            begin
              if CdsLkEntrada.FieldByName('TIPOUNIDADE').AsString = 'Q' then
              begin
                MsgDlg('Esta origem só pode ser apurada por entradas por valor.', 'Atenção', mtError, [mbOK], 0);
                Accept := False;
                exit;
              end;
            end;

            if dbrgrpOrigemEnt.ItemIndex = 2 then
            begin
              if CdsLkEntrada.FieldByName('TIPOUNIDADE').AsString = 'V' then
              begin
                MsgDlg('Esta origem só pode ser apurada por entradas por cotas.', 'Atenção', mtError, [mbOK], 0);
                Accept := False;
                exit;
              end;
            end;

            if dbrgrpOrigemEnt.ItemIndex = 3 then
            begin
              if dblkAlterador.Text = '' then
              begin
                MsgDlg('O alterador deve ser preenchido.', 'Atenção', mtError, [mbOK], 0);
                Accept := False;
                exit;
              end;
            end;                   

          end;

          Accept:= True;
        end;


    //Movimentações
    2 : begin
          if dblkMovimentacao.Text = '' then
          begin
            MsgDlg('O movimento deve ser preenchido.', 'Atenção', mtError, [mbOK], 0 );
            Accept := False;
            exit;
          end;


          if Cdslkmovim.FieldByName('FLGTPMOVIM').AsString = 'T' then
          begin
            if dblkConta.Text = '' then
            begin
              MsgDlg('A conta/fundo deve ser preenchido.', 'Atenção', mtError, [mbOK], 0 );
              Accept := False;
              exit;
            end;
          end;

          if dbrgrpOrigemMov.ItemIndex = 0 then
          begin

            if dblkpEntrada.Text = '' then
            begin
              MsgDlg('A entrada deve ser preenchida.', 'Atenção', mtError, [mbOK], 0);
              Accept := False;
              exit;
            end;

            if Cdslkmovim.FieldByName('TIPOUNIDADE').AsString <> CdsLkEntrada.FieldByName('TIPOUNIDADE').AsString then
            begin
              MsgDlg('A unidade do tipo de movimentação deve ser a mesma da entrada.', 'Atenção', mtError, [mbOK], 0 );
              Accept := False;
              exit;
            end;

          end
          else
          begin
            if dblkRegraCalculo.Text = '' then
            begin
              MsgDlg('A regra deve ser preenchida.', 'Atenção', mtError, [mbOK], 0);
              Accept := False;
              exit;
            end;
          end;
          Accept:= True;
        end;

  end;
end;

procedure TfrmCadRoteiros.CdsEntradaAfterPost(DataSet: TDataSet);
begin
  inherited;
  dbrgBaseado.Enabled  := CdsEntrada.IsEmpty;
  dbrgOperacao.Enabled := CdsEntrada.IsEmpty;
end;

procedure TfrmCadRoteiros.CdsEntradaAfterDelete(DataSet: TDataSet);
begin
  inherited;
  dbrgBaseado.Enabled  := CdsEntrada.IsEmpty;
  dbrgOperacao.Enabled := CdsEntrada.IsEmpty;
end;

procedure TfrmCadRoteiros.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  pnlControlesDet.Enabled := pnlMestre.Enabled;
end;

procedure TfrmCadRoteiros.cdsMovimentacaoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsMovimentacao.FieldByName('FLGORIGEM').AsString := 'E';
end;

procedure TfrmCadRoteiros.cdsMovimentacaoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if cdsMovimentacao.FieldByName('FLGORIGEM').AsString = 'E' then
    cdsMovimentacao.FieldByName('ORIGEM').AsString := 'Entrada'
  else
    cdsMovimentacao.FieldByName('ORIGEM').AsString := 'Regra';
end;

procedure TfrmCadRoteiros.SelecionaOrigemMov;
begin
  pnlEntrada.Visible := dbrgrpOrigemMov.ItemIndex = 0;
  pnlRegra.Visible   := dbrgrpOrigemMov.ItemIndex = 1;
  dblkConta.Enabled := ( Cdslkmovim.FieldByName('FLGTPMOVIM').AsString = 'T' ) or ( Cdslkmovim.FieldByName('FLGTPMOVIM').AsString = 'C' );
end;

procedure TfrmCadRoteiros.cdsMovimentacaoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SelecionaOrigemMov;
end;

procedure TfrmCadRoteiros.dbrgrpOrigemMovClick(Sender: TObject);
begin
  inherited;
  SelecionaOrigemMov;
end;

procedure TfrmCadRoteiros.MsgErro( sMsg : string );
begin
  MsgDlg( sMsg, 'Atenção', mtError, [mbOK], 0 );
end;

procedure TfrmCadRoteiros.dbrgrpOrigemEntClick(Sender: TObject);
begin
  inherited;
  SelecionaOrigemEnt;
end;

procedure TfrmCadRoteiros.SelecionaOrigemEnt;
begin
  pnlRecebDesemb.Visible := dbrgrpOrigemEnt.ItemIndex = 0;
  pnlAlterador.Visible   := dbrgrpOrigemEnt.ItemIndex = 3;
end;

procedure TfrmCadRoteiros.CdsEntradaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  edtEntRecDes.Text := CdsEntrada.FieldByName('DESCEXIBE').AsString;
  SelecionaOrigemEnt;
end;

procedure TfrmCadRoteiros.CdsEntradaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if dbrgBaseado.ItemIndex = 0 then
    cdsEntrada.FieldByName('FLGORIGEM').AsString := 'N';

  if dbrgBaseado.ItemIndex in [1, 2] then
  begin
    if dbrgOperacao.ItemIndex = 0 then
      cdsEntrada.FieldByName('FLGORIGEM').AsString := 'R'
    else
      cdsEntrada.FieldByName('FLGORIGEM').AsString := 'V';
  end;

  if dbrgBaseado.ItemIndex = 3 then
    cdsEntrada.FieldByName('FLGORIGEM').AsString := 'R';

end;

procedure TfrmCadRoteiros.CdsEntradaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbrgrpOrigemEnt.ItemIndex <> 0 then
  begin
    CdsEntrada.FieldByName('DESCEXIBE').Clear;
    CdsEntrada.FieldByName('CODTIPRECDES').Clear;
    CdsEntrada.FieldByName('RECPAG').Clear;
  end
  else
  begin
    CdsEntrada.FieldByName('DESCEXIBE').AsString := edtEntRecDes.Text;
  end;
  if dbrgBaseado.ItemIndex > 0 then
    CdsEntrada.FieldByName('ORIGEM').AsString := dbrgrpOrigemEnt.Items[ dbrgrpOrigemEnt.ItemIndex ]
  else
    CdsEntrada.FieldByName('ORIGEM').AsString := 'Manual';
end;

procedure TfrmCadRoteiros.dbrgBaseadoClick(Sender: TObject);
begin
  inherited;
  DadosOrigem;
end;

procedure TfrmCadRoteiros.CdsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DadosOrigem;
end;

procedure TfrmCadRoteiros.CmeCadastroDelete(Sender: TObject);
begin
  inherited;
  DadosOrigem;
end;

procedure TfrmCadRoteiros.DadosOrigem;
begin
  pnlDadosContas.Visible    := ( dbrgBaseado.ItemIndex > 0 );
  dbrgOperacao.Visible      := ( dbrgBaseado.ItemIndex in [1, 2] );
  pnlDadosContasEnt.Visible := ( dbrgBaseado.ItemIndex > 0 );
  dbrgrpOrigemEnt.Enabled   := ( dbrgBaseado.ItemIndex in [1, 2] );

  if dbrgrpOrigemEnt.Enabled then
    dbrgrpOrigemEnt.Enabled := ( dbrgOperacao.ItemIndex = 0 );
end;

procedure TfrmCadRoteiros.CdsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dbrgBaseado.ItemIndex = 0 then
  begin
    cds.FieldByName('CODTIPRECDES').Clear;
    cds.FieldByName('RECPAG').Clear;
  end;
end;

procedure TfrmCadRoteiros.cmlkpAtivoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SelecionaAtivo;
end;

procedure TfrmCadRoteiros.SelecionaAtivo;
begin
  CdslkConta.Close;
  if cds.FieldByName('IDCPATIVO').AsInteger > 0 then
    CdslkConta.Data := CtrlRoteiros.CarregaConta( cds.FieldByName('IDCPATIVO').AsInteger );
  dblkConta.Enabled := CdslkConta.Active;
end;

procedure TfrmCadRoteiros.cdsMovimentacaoAfterPost(DataSet: TDataSet);
begin
  inherited;
  cmlkpAtivo.Enabled := cdsMovimentacao.IsEmpty;
end;

procedure TfrmCadRoteiros.cdsMovimentacaoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  cmlkpAtivo.Enabled := cdsMovimentacao.IsEmpty;
end;

procedure TfrmCadRoteiros.dbrgOperacaoClick(Sender: TObject);
begin
  inherited;
  DadosOrigem;
end;

procedure TfrmCadRoteiros.dblkMovimentacaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dblkConta.Enabled := ( Cdslkmovim.FieldByName('FLGTPMOVIM').AsString = 'T' ) or ( Cdslkmovim.FieldByName('FLGTPMOVIM').AsString = 'C' );
end;

procedure TfrmCadRoteiros.btnAtualizarListasClick(Sender: TObject);
begin
  inherited;
  CarregarListas;
end;

procedure TfrmCadRoteiros.CarregarListas;
begin
  CdsLkRegra.Data        := CtrlRoteiros.CarregaRegra;
  Cdslkmovim.Data        := CtrlRoteiros.CarregaMovimento;
  CdsLkEntrada.Data      := CtrlRoteiros.CarregaCpEntrada;
  cdsAlterador.Data      := CtrlRoteiros.CarregaAlterador;
end;

procedure TfrmCadRoteiros.btnRecDesPrincClick(Sender: TObject);
begin
  inherited;
  msRecDes.Executar;
  if msRecDes.RetornouValor then
  begin
    edtRecDesPrinc.Text := msRecDes.ValoresChave[0] + ' (' + msRecDes.ValoresChave[1] + ') - ' + msRecDes.ValoresChave[2];
    cds.FieldByName('CODTIPRECDES').AsString := msRecDes.ValoresChave[0];
    cds.FieldByName('RECPAG').AsString       := msRecDes.ValoresChave[1];
  end;
end;

procedure TfrmCadRoteiros.CdsAfterClose(DataSet: TDataSet);
begin
  inherited;
  edtRecDesPrinc.Clear;
end;

procedure TfrmCadRoteiros.CdsAfterDelete(DataSet: TDataSet);
begin
  inherited;
  edtRecDesPrinc.Clear;
end;

procedure TfrmCadRoteiros.CdsAfterInsert(DataSet: TDataSet);
begin
  inherited;
  edtRecDesPrinc.Clear;
end;

procedure TfrmCadRoteiros.btnEntRecDesClick(Sender: TObject);
begin
  inherited;
  msRecDes.Executar;
  if msRecDes.RetornouValor then
  begin
    edtEntRecDes.Text := msRecDes.ValoresChave[0] + ' (' + msRecDes.ValoresChave[1] + ') - ' + msRecDes.ValoresChave[2];
    CdsEntrada.FieldByName('CODTIPRECDES').AsString := msRecDes.ValoresChave[0];
    CdsEntrada.FieldByName('RECPAG').AsString       := msRecDes.ValoresChave[1];
  end;
end;

end.
