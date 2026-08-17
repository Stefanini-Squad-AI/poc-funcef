unit FPagtoEmprestimoResgate;

// Alterações:
{
 --------------------------------------------------------------------------------------------------
Pendência   : SOL 253185 PPM 771995
Responsável : William Moreira da Silva
Data        : 17/06/2015
Descrição   : Reestruturação da HistMovEmptmo(*Retirada dos Hint's)
 --------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, MontaSelect, Grids, DBGrids,
  wwdbdatetimepicker, uTypesEmptmo, Db, DBTables, Wwquery, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, DBClient, wwclient, OpenArqText, fcButton, fcImgBtn,
  fcShapeBtn;

type
  TfrmPagtoEmprestimoResgate = class(TfrmOkCancelar)
    MontaSelect: TMontaSelect;
    btnProcessar: TButton;
    qryDetalhe: TwwQuery;
    dsContrato: TwwDataSource;
    ntb: TNotebook;
    btnBuscaMatricula: TBitBtn;
    grpContratos: TGroupBox;
    lblDataResgate: TLabel;
    dtpDataResgate: TwwDBDateTimePicker;
    memResult: TMemo;
    Panel3: TPanel;
    qryContratoParaCalculo: TwwQuery;
    qryMatricula: TwwQuery;
    cdsContrato: TwwClientDataSet;
    cdsContratoSeleciona: TBooleanField;
    cdsContratoIDCONTRATOEMPTMO: TFloatField;
    cdsContratoMODALIDADE: TStringField;
    cdsContratoDATACREDITO: TDateTimeField;
    cdsContratoHMESALDODEV: TFloatField;
    cdsContratoVALOR_TOTAL_ABERTO: TFloatField;
    cdsContratoMATRICULA: TStringField;
    cdsContratoIDPATRO: TFloatField;
    cdsContratoPATRO: TStringField;
    dsMatricula: TwwDataSource;
    btnCarregarMatriculas: TButton;
    OpenDialog: TOpenDialog;
    qrySeProcessado: TwwQuery;
    Label1: TLabel;
    gridContrato: TwwDBGrid;
    btnVoltar: TfcShapeBtn;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    qryGeraResgate: TwwQuery;
    qryMatriculaMATRICULA: TStringField;
    qryMatriculaIDCONTRATOEMPTMO: TFloatField;
    qryDetalheMATRICULA: TStringField;
    qryDetalheIDCONTRATOEMPTMO: TFloatField;
    qryDetalheMODALIDADE: TStringField;
    qryDetalheDATACREDITO: TDateTimeField;
    qryDetalheIDPATRO: TFloatField;
    qryDetalhePATRO: TStringField;
    qryDetalheHMESALDODEV: TFloatField;
    qryDetalheVALOR_TOTAL_ABERTO: TFloatField;
    qryMatriculaDATARESGATE: TStringField;
    edtMatricula: TEdit;
    edtNome: TEdit;
    updGeraResgate: TUpdateSQL;
    cdsContratoIDPLANOORIGEM: TIntegerField;
    qryDetalheIDPLANOORIGEM: TFloatField;
    procedure btnBuscaMatriculaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure btnCarregarMatriculasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    rContrato : TDadosContrato;
    vLista    : TListaItem;
    vDataInicioProcesso : TDateTime;
    vMatriculas, vContratos : String;
    vSaldoDevedorTotal : Currency;

    procedure gridContratoOnClick(Sender : TObject);
    function PreencheEnviaResgate(IdPatro, IdItemEmptmo, IdProvento : Integer; IdContratoEmptmo : Double; SaldoDevedor : Currency) : Boolean;
    function CalculaItens(var SaldoDevedor : Currency; var IdItemEmptmo : Integer) : Boolean;
    function EnviaParaFolha(Patro : String; IdPatro : Integer) : Boolean;
    procedure CarregaContratos(Matriculas :  String);
    function ContratosSelecionados(IdProvento : String) : Boolean;
    function ProcessaItens(IdProvento : Integer) : Boolean;
    procedure SomenteLeitura(Estado : Boolean);
  public
    { Public declarations }
  end;

var
  frmPagtoEmprestimoResgate: TfrmPagtoEmprestimoResgate;

implementation

uses UCalcEmptmo, uMensErro, UFuncoesEmptmo, dEmptmo, dCalcEmptmo, UIntegraEmptmo, dBaseDados, UDataBase, FProgresso;

{$R *.DFM}

procedure TfrmPagtoEmprestimoResgate.FormCreate(Sender: TObject);
begin
  inherited;
  gridContrato.ControlStyle := gridContrato.ControlStyle + [csClickEvents];
  TForm(gridContrato).OnClick := GridContratoOnClick;
end;

procedure TfrmPagtoEmprestimoResgate.FormShow(Sender: TObject);
begin
  inherited;
  dtpDataResgate.Date := Date;
  cdsContrato.CreateDataset;
end;

procedure TfrmPagtoEmprestimoResgate.gridContratoOnClick(Sender : TObject);
begin
  if cdsContrato.RecordCount > 0 then
    if not btnProcessar.Enabled then
      if cdsContratoSeleciona.AsBoolean then
        btnProcessar.Enabled := True;
end;

procedure TfrmPagtoEmprestimoResgate.btnBuscaMatriculaClick(Sender: TObject);
begin
  inherited;
  MontaSelect.Executar();

  if MontaSelect.RetornouValor then
    begin
      edtMatricula.Text := MontaSelect.ValoresChave[0];
      edtNome.Text      := MontaSelect.ValoresChave[2];

      CarregaContratos(QuotedStr(MontaSelect.ValoresChave[0]));
    end;
end;

procedure TfrmPagtoEmprestimoResgate.CarregaContratos(Matriculas : String);
begin
  Screen.Cursor := crHourGlass;

  // Limpando o ClientDataSet
  cdsContrato.EmptyDataSet;

  qryMatricula.Close;
  qryMatricula.SQL.Clear;
  qryMatricula.SQL.Text := 'SELECT D.MATRICULA, C.IDCONTRATOEMPTMO ,     ' +
                           QuotedStr(dtpDataResgate.Text) + ' DATARESGATE' +
                          '  FROM DEPENTIT D, CONTRATOEMPTMO C           ' +
                          ' WHERE C.IDPESSOA = D.IDTITULAR               ' +
                          '   AND C.IDBENEF  = D.IDPESSOA                ' +
                          '   AND C.FLGSITUACAO in (''A'',''E'')         ' +
                          '   AND D.MATRICULA in ( ' + Matriculas + ' )  ';
  qryMatricula.Open;

  if qryMatricula.IsEmpty then
    begin
      btnProcessar.Enabled := False;
      Exit;
    end
  else
    begin
      qryDetalhe.Close;
      qryDetalhe.Open;
      cdsContrato.DisableControls;

      SomenteLeitura(False);

      while not qryMatricula.Eof do
        begin
          while not qryDetalhe.Eof do
            begin
              cdsContrato.Insert;
              cdsContratoIDCONTRATOEMPTMO.AsFloat   := qryDetalheIDCONTRATOEMPTMO.AsFloat;
              cdsContratoMODALIDADE.AsString        := qryDetalheMODALIDADE.AsString;
              cdsContratoDATACREDITO.AsDateTime     := qryDetalheDATACREDITO.AsDateTime;
              cdsContratoHMESALDODEV.AsFloat        := qryDetalheHMESALDODEV.AsFloat;
              cdsContratoVALOR_TOTAL_ABERTO.AsFloat := qryDetalheVALOR_TOTAL_ABERTO.AsFloat;
              cdsContratoMATRICULA.AsString         := qryDetalheMATRICULA.AsString;
              cdsContratoIDPATRO.AsInteger          := qryDetalheIDPATRO.AsInteger;
              cdsContratoPATRO.AsString             := qryDetalhePATRO.AsString;
              cdsContratoIDPLANOORIGEM.AsInteger    := qryDetalheIDPLANOORIGEM.AsInteger;
              cdsContrato.Post;
              qryDetalhe.Next;
            end;
          qryMatricula.Next;
        end;

      cdsContrato.First;
      cdsContrato.EnableControls;
      SomenteLeitura(True);
      qryMatricula.Close;
      qryDetalhe.Close;
    end;
  Screen.Cursor := crDefault;
  Repaint;
end;

procedure TfrmPagtoEmprestimoResgate.SomenteLeitura(Estado : Boolean);
begin
  cdsContratoIDCONTRATOEMPTMO.ReadOnly   := Estado;
  cdsContratoMODALIDADE.ReadOnly         := Estado;
  cdsContratoDATACREDITO.ReadOnly        := Estado;
  cdsContratoHMESALDODEV.ReadOnly        := Estado;
  cdsContratoVALOR_TOTAL_ABERTO.ReadOnly := Estado;
end;

procedure TfrmPagtoEmprestimoResgate.btnProcessarClick(Sender: TObject);
var
  IdProvento : Integer;
begin
  // Ativando o filtro para deixar apenas os selecionados
  cdsContrato.Filtered := True;
  cdsContrato.First;

  if cdsContrato.IsEmpty then
    MsgDlg('É necessário selecionar um contrato.','Atenção',mtInformation, [mbOk],0)
  else if MsgDlg('Deseja enviar valor à quitar dos contratos selecionados para folha de resgate?', 'Atenção!', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Repaint;
      cdsContrato.DisableControls;
      cdsContrato.First;
      IdProvento := dtmEmptmo.qryParamEmptmoIDPROVENTO.AsInteger;  // parâmetro da tela Parâmetros do Sistema, aba Integrações

      // Veirifica se algum contrato foi selecionado e se desses selecionados algum já foi processado na data escolhida na tela
      if ContratosSelecionados(IntToStr(IdProvento)) then
        begin

          if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

          if ProcessaItens(IdProvento) then
            begin
              if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

              // Mantando o Resultado de Envio
              memResult.Clear;
              memResult.Lines.Add('Início do Processamento: ' + DateTimeToStr(vDataInicioProcesso));
              memResult.Lines.Add('           ');
              memResult.Lines.Add('           ');
              memResult.Lines.Add('           ');
              memResult.Lines.Add('Matrícula(s): ' + vMatriculas);
              memResult.Lines.Add('           ');
              memResult.Lines.Add('Data do Resgate: ' + DateToStr(dtpDataResgate.Date));
              memResult.Lines.Add('           ');
              memResult.Lines.Add('Valor Total da Dívida: ' +  CurrToStrF(vSaldoDevedorTotal,ffCurrency,2));
              memResult.Lines.Add('           ');
              memResult.Lines.Add('Contratos de Empréstimos Enviados: ' + vContratos);
              memResult.Lines.Add('           ');
              memResult.Lines.Add('Final do Processo: ' + DateTimeToStr(Now));
              memResult.Lines.Add('           ');
              memResult.Lines.Add('Tempo do Processo: ' + TimeToStr(vDataInicioProcesso - Now));

              ntb.PageIndex := 1;
              btnProcessar.Visible := False;
            end
          else
            if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;

          frmProgresso.EscondeFormProgresso;
        end;
      cdsContrato.EnableControls;
    end;

  cdsContrato.Filtered := False;
  cdsContrato.First;
  frmPagtoEmprestimoResgate.Refresh;
  gridContrato.RefreshDisplay;
  Screen.Cursor := crDefault;
end;

function TfrmPagtoEmprestimoResgate.ContratosSelecionados(IdProvento : String) : Boolean;
var
  MesRef, NoDocumento : String;
begin
  // Verificando se dos contratos selecionados algum já foi processado

  Try
  vContratos  := '';
  vContratos  := FloatToStr(cdsContratoIDCONTRATOEMPTMO.AsFloat);
  vMatriculas := cdsContratoMATRICULA.AsString;
  cdsContrato.Next;

  while not cdsContrato.Eof do
    begin
      // O valor desses parâmetros serão usados também no 'Resultado de Envio'
      vContratos  := vContratos + ', ' + FloatToStr(cdsContratoIDCONTRATOEMPTMO.AsFloat);

      // Verifica já tem essa matrícula no parâmetro, se não tiver retorna 0 e adiciona a matrícula
      if Pos(cdsContratoMATRICULA.AsString, vMatriculas) = 0 then
        vMatriculas := vMatriculas + ', ' + cdsContratoMATRICULA.AsString;
      cdsContrato.Next;
    end;
  MesRef := FormatDateTime('yyyy',dtpDataResgate.Date) + '/' + FormatDateTime('mm',dtpDataResgate.Date);

  qrySeProcessado.Close;
  qrySeProcessado.SQL.Clear;
  qrySeProcessado.SQL.Text := 'SELECT T.NODOCUMENTO FROM TMPDESC T '            +
                              ' WHERE T.MESREFERENCIA = ' + QuotedStr(MesRef) +
                              '   AND T.IDPROVENTO    = ' + IdProvento        +
                              '   AND T.NODOCUMENTO IN (' + vContratos  + ')';
  qrySeProcessado.Open;

  if not qrySeProcessado.IsEmpty then
    begin

      // Pegando os Contratos que já foram processados para mostrar na mensagem
      NoDocumento := FloatToStr(qrySeProcessado.FieldByName('NODOCUMENTO').AsFloat);
      qrySeProcessado.Next;

      while not qrySeProcessado.Eof do
        begin
          NoDocumento := NoDocumento + ', ' + FloatToStr(qrySeProcessado.FieldByName('NODOCUMENTO').AsFloat);
          qrySeProcessado.Next;
        end;

      MsgDlg('Mutuário(s) já processado(s), contrato(s): ' + NoDocumento + '.','Atenção',mtInformation, [mbOk],0);
      Result := False;
    end
  else
    Result := True;
  Except
    MsgDlg('Erro ao verificar se algum contrato já foi processado.','Erro!',mtError, [mbOk],0);
    Result := False;
  end;
end;

function TfrmPagtoEmprestimoResgate.ProcessaItens(IdProvento : Integer) : Boolean;
var
  i : Integer;
  SaldoDevedor : Currency;
  IdPatro, IdItemEmptmo : Integer;
  IdContratoEmptmo : Double;
  Patro : String;
begin
  // Parâmetro usado no 'Resultado de Envio'
  vDataInicioProcesso := Now;

  i := 0;
  cdsContrato.First;
  Result := True;
  vSaldoDevedorTotal := 0;

  frmProgresso.MostraFormProgresso('Pagamento de Empréstimo com Resgate...',
                                  True,
                                  True,
                                  True,
                                  0,
                                  cdsContrato.RecordCount
                                 );
  frmProgresso.Refresh;

  while not((cdsContrato.Eof) or (frmProgresso.Cancelou)) do
    begin
      IdPatro := cdsContrato.FieldByName('IDPATRO').AsInteger;
      IdContratoEmptmo := cdsContrato.FieldByName('IDCONTRATOEMPTMO').AsFloat;
      Patro := cdsContrato.FieldByName('PATRO').AsString;
      SaldoDevedor := 0;

      // Pegando Saldo Devedor calculando também itens em atraso
      if (not CalculaItens(SaldoDevedor,IdItemEmptmo)) or (frmProgresso.Cancelou) then
        begin
          MsgDlg('Ocorreu um erro no cálculo do saldo devedor do contrato ' + FloatToStr(IdContratoEmptmo) +
                 '.Todo o processamento será abortado.', 'Erro!', mtError, [mbOk], 0);
          Result := False;
          Exit;
        end;

      // Preparando para enviar para Folha
      if not PreencheEnviaResgate(IdPatro,IdItemEmptmo,IdProvento,IdContratoEmptmo,SaldoDevedor) then
        begin
          MsgDlg('Não foi encontrado item para enviar para folha, na data resgate ' + DateToStr(dtpDataResgate.Date) +
                 ', no contrato ' + FloatToStr(IdContratoEmptmo) + '.' + #13 +
                 'Todo o processamento será abortado.', 'Erro!', mtError, [mbOk], 0);
          Result := False;
          Exit;
        end;

      //Envia para Folha
      if (not EnviaParaFolha(Patro,IdPatro)) or (frmProgresso.Cancelou) then
        begin
          MsgDlg('Ocorreu um erro ao enviar para folha valores do contrato ' + FloatToStr(IdContratoEmptmo) +
                 '.Todo o processamento será abortado.', 'Erro!', mtError, [mbOk], 0);

          Result := False;
          Exit;
        end;

      vSaldoDevedorTotal := vSaldoDevedorTotal + SaldoDevedor;
      cdsContrato.Next;
      Inc(i);
      frmProgresso.AndaFormProgresso(i);
      frmProgresso.Refresh;
    end;

  // Se saiu o while porque o processo foi cancelado deve retorar false para dar rollback na transação
  if frmProgresso.Cancelou then
    Result := False;
end;

function TfrmPagtoEmprestimoResgate.CalculaItens(var SaldoDevedor : Currency; var IdItemEmptmo : Integer) : Boolean;
var
  i : Integer;
begin

  Try
    qryContratoParaCalculo.Close;
    qryContratoParaCalculo.Params[0].AsString := cdsContrato.FieldByName('MATRICULA').AsString;
    qryContratoParaCalculo.Params[1].AsFloat := cdsContrato.FieldByName('IDCONTRATOEMPTMO').AsFloat;
    qryContratoParaCalculo.Open;

    if not qryContratoParaCalculo.IsEmpty then
      begin
        PreencheDadosContrato(qryContratoParaCalculo, rContrato);

        if (CalcEmptmo.CalculaItensQuitacaoNOVA(rContrato,
                                                3,
                                                dtpDataResgate.Date,
                                                -1,
                                                0,
                                                vLista,
                                                False, // Não mostrar mensagem
                                                False, // Não mostrar progresso
                                                False
                                               )) then
          begin
            for i := 0 to High(vLista) do
              begin
                if (vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1) then
                  begin
                    SaldoDevedor := SaldoDevedor + vLista[i].Valor;
                    IdItemEmptmo := vLista[i].IDItemCentraliza;
                  end;
              end;
            Result := True;
          end
        else
          Result := False;
      end
    else
      Result := False;
  Except
    Result := False;
  end;
end;

function TfrmPagtoEmprestimoResgate.PreencheEnviaResgate(IdPatro, IdItemEmptmo, IdProvento : Integer; IdContratoEmptmo : Double; SaldoDevedor : Currency) : Boolean;
begin
  qryGeraResgate.Close;
  qryGeraResgate.ParamByName('PIDCONTRATOEMPTMO').AsFloat := IdContratoEmptmo;
  qryGeraResgate.Open;

  if qryGeraResgate.IsEmpty then
     Result := False
  else
    begin
      // Altera somente os campos necessários
      qryGeraResgate.Edit;
      qryGeraResgate.FieldByName('HMEVLRPREVISTO').AsFloat     := SaldoDevedor;
      qryGeraResgate.FieldByName('HMETIPOMOV').AsFloat         := 0;
      qryGeraResgate.FieldByName('ITEDESCRICAO').AsString      := 'Valor calculado para quitação';
      qryGeraResgate.FieldByName('IDRUBRICA').AsFloat          := IdProvento;
      qryGeraResgate.FieldByName('IDITEMEMPTMO').AsFloat       := IdItemEmptmo;
      qryGeraResgate.FieldByName('HMESALDODEV').AsCurrency     := SaldoDevedor;
      qryGeraResgate.FieldByName('ANOMESCOMPETENCIA').AsString := FormatDateTime('yyyy',dtpDataResgate.Date) + FormatDateTime('mm',dtpDataResgate.Date);
      qryGeraResgate.FieldByName('HMEDATAVENCTO').AsDateTime   := dtpDataResgate.Date;
      qryGeraResgate.FieldByName('IDPLANOORIGEM').AsInteger    := cdsContratoIDPLANOORIGEM.AsInteger;
      qryGeraResgate.Post;
     Result := True;
  end;
end;

function TfrmPagtoEmprestimoResgate.EnviaParaFolha(Patro : String; IdPatro : Integer) : Boolean;
var
  sMsgLog, sDescricao, sTipoFolha, MesRef : String;
  sResult, sErro    : TStringList;
  fTotalPatro 	    : Currency;
  iLote, iTotalReg  : Integer;
begin
  Try
    sResult := TStringList.Create;
    sErro   := TStringList.Create;
    iLote   := -1;
    fTotalPatro := 1;
    MesRef := FormatDateTime('yyyy',dtpDataResgate.Date) + FormatDateTime('mm',dtpDataResgate.Date);

    if IntegraEmptmo.EnviaTMPDESC(' ',
                                  'Empréstimo - Envio ref: ' + MesRef,
                                  Patro,           //cdsContratoNomePatro.AsString,
                                  MesRef,          // Ano e Mês Cobrança
                                  Sysdate,         // Data Lançamento
                                  sResult,         // Lista de Resultados que será apresentado no memResult
                                  sErro,           // Lista de Erros que será apresentado no memErro
                                  IdPatro,         // id Patrocinadora
                                  iLote,           // Lote
                                  iTotalReg,       // Total de Registros enviado pela patrocinadora
                                  fTotalPatro,     // Valor Total enviado pela patrocinadora
                                  0,
                                  False,
                                  True,            // Não agrupa
                                  1,               // Parâmetro para Enviar para Folha de Resgate
                                  qryGeraResgate  // Query com os dados para Envio
                                 ) <> 0 then
      begin
        Result := False;
      end
    else
      Result := True;
  Except
    Result := False;
  end;
end;

procedure TfrmPagtoEmprestimoResgate.btnCarregarMatriculasClick(
  Sender: TObject);
var
  arqEntrada: TextFile;
  sLinha, Matr: String;
begin
  if OpenDialog.Execute then
    begin
      edtMATRICULA.Text := '';
      edtNome.Text := '';

      AssignFile(arqEntrada, OpenDialog.FileName);
      ReSet(arqEntrada);

      Readln(arqEntrada, sLinha);
      Matr := QuotedStr(trim(copy(slinha,1,7)));

      while not Eof(arqEntrada) do
        begin
          Readln(arqEntrada, sLinha);
          Matr := Matr + ', ' + QuotedStr(trim(copy(slinha,1,7)));
        end;
      CloseFile(arqEntrada);
      Repaint;
      CarregaContratos(Matr);
    end;
end;

procedure TfrmPagtoEmprestimoResgate.btnVoltarClick(Sender: TObject);
begin
  inherited;
  ntb.PageIndex := 0;
  btnProcessar.Visible := True;
end;

procedure TfrmPagtoEmprestimoResgate.BitBtn6Click(Sender: TObject);
begin
  inherited;

  // Marcando todos
  if cdsContrato.RecordCount > 0 then
    begin
      cdsContrato.First;
      cdsContrato.DisableControls;

      while not cdsContrato.Eof do
        begin
          cdsContrato.Edit;
          cdsContratoSeleciona.AsBoolean := True;
          cdsContrato.Post;
          cdsContrato.Next;
        end;

      cdsContrato.First;
      cdsContrato.EnableControls;
    end;

  // Com algum marcado então botão pode ficar habilitado  
  btnProcessar.Enabled := True;
end;

procedure TfrmPagtoEmprestimoResgate.BitBtn5Click(Sender: TObject);
begin
  inherited;

  // Desmarcando todos
  if cdsContrato.RecordCount > 0 then
    begin
      cdsContrato.First;
      cdsContrato.DisableControls;

      while not cdsContrato.Eof do
        begin
          cdsContrato.Edit;
          cdsContratoSeleciona.AsBoolean := False;
          cdsContrato.Post;
          cdsContrato.Next;
        end;

      cdsContrato.First;
      cdsContrato.EnableControls;
    end;

  // Se nenhum estiver marcado então o botão deve ser desabilitado
  btnProcessar.Enabled := False;
end;

end.
