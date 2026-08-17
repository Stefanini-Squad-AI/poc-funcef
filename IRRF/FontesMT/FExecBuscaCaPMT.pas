unit FExecBuscaCaPMT;

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina....: (dfm) sqlDocumento acrescentar campo DATAVENCTO no cdsdocumento
N. SIG....: 91336
Data .....: 05/09/2019
Autor.....: Taffarel Sevaybriker
Descrição.: Correção na consulta de busca de Impostos. Buscar pela DATAVECNTO para natureza <> 1708.
----------------------------------------------------------------------------------------------------
Rotina    : CtrlBuscaCaP
Data      : 01/04/2016
Autor     : Darivaldo Alencar
SOL       : 270178 ppm:  1352233
Descrição : Erro na Soma de VLRIRRF do modulo 64, removido fields do CdsDocumento no dfm
----------------------------------------------------------------------------------------------------
Rotina    : alteração de DFM componente SQL sqlDocumento
Data      : 10/05/2012
Autor     : Fernando Xavier
Pendencia : 179844
Descrição : 1660740
----------------------------------------------------------------------------------------------------
Rotina    : - 
Data      : 30/05/2007
Autor     : André Pontes
Pendencia : 25480
Descrição : Exibição do NoDocumento na grid, em vez do CodDocumento
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 29/03/2007
Autor     : André Pontes
Pendencia : -
Descrição : Exibição do código de pagamento na grid em tela
----------------------------------------------------------------------------------------------------
Rotina    :
Data      : 09/02/2007 a 23/02/2007
Autor     : André Pontes
Pendencia : 24451
Descrição : Nova tela para buscar todos os impostos do Contas a Pagar
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, wwdblook, StdCtrls, wwdbdatetimepicker, CMDateTimePicker,
  IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, CMProcuraSubTipo,
  uCtrlBuscaCaP, uCtrlNatuRendimento, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TfrmExecBuscaCaPMT = class(TfrmWizardMT)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtDataInicio: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    chkProcIR: TCheckBox;
    chkProcINSS: TCheckBox;
    chkProcPIS: TCheckBox;
    Label1: TLabel;
    DBcboNatuIR: TwwDBLookupCombo;
    chkProcISS: TCheckBox;
    DBcboNatuINSS: TwwDBLookupCombo;
    DBcboNatuPIS: TwwDBLookupCombo;
    DBcboNatuISS: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    edtCodDocumento: TEdit;
    edtNumDocumento: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtNomeFavorecido: TEdit;
    Label8: TLabel;
    Panel3: TPanel;
    TabSheet2: TTabSheet;
    memResult: TMemo;
    memErro: TMemo;
    fcLabel2: TfcLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    btnBuscaDoc: TBitBtn;
    CMProcuraForCli: TCMProcuraForCli;
    GroupBox4: TGroupBox;
    btnBuscar: TSpeedButton;
    btnDesfazer: TSpeedButton;
    edtDataLancto: TCMDateTimePicker;
    Label11: TLabel;
    edtValorDoc: TEdit;
    Label9: TLabel;
    sqlDocumento: TCMSqlParams;
    cdsDocumento: TCMClientDataSet;
    dtsDocumento: TwwDataSource;
    dbgINSS: TwwDBGrid;
    chkRendimento: TCheckBox;
    btnLimpaDoc: TBitBtn;
    lblRegisros: TLabel;
    lblDesfazer: TfcLabel;

    procedure btnContinuarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBuscaDocClick(Sender: TObject);
    procedure btnLimpaDocClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure dbgINSSTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private // Private declarations

    CtrlBuscaCaP        : TCtrlBuscaCaP;
    CtrlNatuRendimento  : TCtrlNatuRendimento;

    function  VerificaPreenchimento: Boolean;
    procedure PreenchePropriedades;


  public  // Public declarations

    procedure Progresso(vParam : array of Variant);


  end;



var
  frmExecBuscaCaPMT: TfrmExecBuscaCaPMT;



implementation
{$R *.DFM}
uses
  dBaseDados, uDataBase, uMensErro, uSistema, uVerificaPreenchimento, fProgresso, DLookIRRF;



function TfrmExecBuscaCaPMT.VerificaPreenchimento: Boolean;
begin
	Result := False;

	try
    if not(chkProcIR.Checked or chkProcINSS.Checked or chkProcPIS.Checked or chkProcISS.Checked or chkRendimento.Checked) then
      raise EValidacao.CreateVal('Não foi selecionado imposto ou rendimento!', chkProcIR);

    if length(trim(edtDataInicio.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a data inicial para busca!', edtDataInicio);

    if length(trim(edtDataFim.Text)) = 0 then
      raise EValidacao.CreateVal('É necessário indicar a data final para busca!', edtDataFim);

    if not(edtDataFim.Date >= edtDataInicio.Date) then
      raise EValidacao.CreateVal('A data final do período para busca deve ser posterior à data inicial!', edtDataFim);

  except

    on ev : EValidacao do
    begin
		  if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
			Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;

  end;



  Result := True;
end;



procedure TfrmExecBuscaCaPMT.btnContinuarClick(Sender: TObject);
var
  sMsg      : string;
  dDataIni  : TDateTime;
begin
  case pagControle.ActivePageIndex of

    // ---------------------------------------------------------------------------------------------

    0:
    begin
      if not(VerificaPreenchimento) then Exit;

      PreenchePropriedades;

      cdsDocumento.Close;

      lblDesfazer.Visible := btnDesfazer.Down;

      if btnBuscar.Down then
      begin
        sMsg := 'Essa operação irá buscar dados de Contas a Pagar. ' + #13 + #13 + 'Deseja prosseguir?';
        if MsgDlg(sMsg, Sistema.NomeModulo, mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
        Repaint;

        cdsDocumento.Data   := CtrlBuscaCaP.ListaImpostosBusca;
        lblRegisros.Caption := FormatFloat('#,#0', cdsDocumento.RecordCount) + ' Registros';
        inherited;
      end
      else
      begin
        sMsg := 'Essa operação irá DESFAZER a busca de dados de Contas a Pagar. ' + #13 + #13 + 'Deseja REALMENTE prosseguir?';
        if MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbYes, mbNo], 0) = mrNo then Exit;
        Repaint;

        // Verifica se as naturezas não foram preenchidas e avisa...
        if (
           (chkProcIR.Checked)    and (DBcboNatuIR.LookupValue    = '') or
           (chkProcINSS.Checked)  and (DBcboNatuINSS.LookupValue  = '') or
           (chkProcPIS.Checked)   and (DBcboNatuPIS.LookupValue   = '') or
           (chkProcISS.Checked)   and (DBcboNatuISS.LookupValue   = '')
           ) then
        begin
          sMsg := 'Embora opcional, sugere-se indicar a Natureza da Operação para desfazer buscas.' + #13 + #13 +
                  'Deseja prosseguir mesmo sem indicar a Natureza?';

          if MsgDlg(sMsg, Sistema.NomeModulo, mtWarning, [mbYes, mbNo], 0) = mrNo then Exit;
          Repaint;
        end;
        Repaint;

        cdsDocumento.Data   := CtrlBuscaCaP.ListaImpostosDesfazer;
        lblRegisros.Caption := FormatFloat('#,#0', cdsDocumento.RecordCount) + ' Registros';

        inherited;
      end;
    end;

    // ---------------------------------------------------------------------------------------------

    1:
    begin
      if cdsDocumento.IsEmpty then
      begin
        sMsg := 'Não foram encontrados impostos nem rendimentos com os filtros selecionados.';
        MsgDlg(sMsg, Sistema.NomeModulo, mtInformation, [mbOk], 0);
        Repaint;
        Exit;
      end;
      CtrlBuscaCaP.CreateThreadProgresso;

      try
        // -------------------------------------------------------------------------------------------
        // Prepara os memos de resultado

        dDataIni := Now;

        memResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', dDataIni));
        memResult.Lines.Add(' ');

        // coloca os cabeçalhos nos memos
        memResult.Clear;
        memResult.Lines.Add('           Documento  Data        Imposto          Valor Base     Vlr.Imposto    Favorecido ');
        memResult.Lines.Add('           ---------- ----------- ---------------- -------------- -------------- ----------------------------------------');

        memErro.Clear;
        memErro.Lines.Add('           Documento  Data        Imposto          Valor Base     Vlr.Imposto    Ocorrência ');
        memErro.Lines.Add('           ---------- ----------- ---------------- -------------- -------------- ----------------------------------------');

        // -------------------------------------------------------------------------------------------

        if btnBuscar.Down then
        begin
          if not(CtrlBuscaCaP.ValidaCdsDocumento) then
          begin
            inherited;
            Exit;
          end;
        end;

        // -----------------------------------------------------------------------------------------

        if btnBuscar.Down then
        begin
          CtrlBuscaCaP.GeraImpostos;
          inherited;
        end
        else
        begin
          CtrlBuscaCaP.DesfazImpostos;
          inherited;
        end;

        // -----------------------------------------------------------------------------------------

        memResult.Lines.Add(' ');
        memResult.Lines.Add('Final do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
        memResult.Lines.Add(' ');
        memResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));

        // -------------------------------------------------------------------------------------------

      finally
        CtrlBuscaCaP.FreeThreadProgresso;
        frmProgresso.EscondeFormProgresso;
      end;
    end;

    // ---------------------------------------------------------------------------------------------
  end;
end;



procedure TfrmExecBuscaCaPMT.PreenchePropriedades;
begin
  // a processar
  CtrlBuscaCaP.ProcIR       := chkProcIR.Checked;
  CtrlBuscaCaP.ProcINSS     := chkProcINSS.Checked;
  CtrlBuscaCaP.ProcPIS      := chkProcPIS.Checked;
  CtrlBuscaCaP.ProcISS      := chkProcISS.Checked;
  CtrlBuscaCaP.ProcRend     := chkRendimento.Checked;

  // naturezas
  CtrlBuscaCaP.NatuIR       := DBcboNatuIR.LookupValue;
  CtrlBuscaCaP.NatuINSS     := DBcboNatuINSS.LookupValue;
  CtrlBuscaCaP.NatuPIS      := DBcboNatuPIS.LookupValue;
  CtrlBuscaCaP.NatuISS      := DBcboNatuISS.LookupValue;

  // Favorecido
  CtrlBuscaCaP.Favorecido   := -1;
  if CMProcuraForCli.ForCliReg.Id > 0 then
    CtrlBuscaCaP.Favorecido := CMProcuraForCli.ForCliReg.Id;

  // Documento
  CtrlBuscaCaP.Documento    := -1;
  if length(trim(edtCodDocumento.Text)) > 0 then
    CtrlBuscaCaP.Documento  := StrToInt(edtCodDocumento.Text);

  // período de datas
  CtrlBuscaCaP.DataIni      := edtDataInicio.Date;
  CtrlBuscaCaP.DataFim      := edtDataFim.Date;

  // Empresa
  CtrlBuscaCaP.EmpresaProp  := Sistema.IDEmpresa;
  CtrlBuscaCaP.UsaPlanPatro := Sistema.UsaPlanoPatro;
end;



procedure TfrmExecBuscaCaPMT.FormCreate(Sender: TObject);
var
  iAno : Integer;
begin
  inherited;

  iAno := DiasUteis.ExtraiAno(Date);
  iAno := iAno - 1;


  CMProcuraForCli.ForCli  := fcFornecedor;

  // -----------------------------------------------------------------------------------------------

  CtrlBuscaCaP            := TCtrlBuscaCaP.Create;
  CtrlNatuRendimento      := TCtrlNatuRendimento.Create;

  CtrlBuscaCaP.Initialize(dtmBaseDados.dbBaseDados,
                          True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,
                          True,
                          nil,
                          nil,
                          False
                         );

  CtrlNatuRendimento.InitializeAs(CtrlBuscaCaP);

  // -----------------------------------------------------------------------------------------------

  CtrlBuscaCaP.cdsDocumento         := cdsDocumento;
  CtrlBuscaCaP.Progresso            := Progresso;

  dtmLookIRRF.cdsLookNatureza.Data  := CtrlNatuRendimento.ListNaturendimento;

  // -----------------------------------------------------------------------------------------------
end;



procedure TfrmExecBuscaCaPMT.Progresso(vParam: array of Variant);
begin
//   vParam[0] :  BILHETE
//   vParam[1] :  Tipo da operação (0 = mostra, 1 = anda, 2 = esconde)
//   vParam[2] :  Mínimo de Registros
//   vParam[3] :  Total de Registros
//   vParam[4] :  Registro Atual
//   vParam[5] :  mensagem
//   vParam[6] :  0 = ERRO, 1 = Ok

   case vParam[1] of

      // -------------------------------------------------------------------------------------------

      0: frmProgresso.MostraFormProgresso(vParam[5],  // Legenda
                                          False,      // Botão Visivel
                                          False,      // Botão Habilitado
                                          True,       // Barra Visível
                                          vParam[2],  // Mínimo
                                          vParam[3]   // Máximo
                                         );

      // -------------------------------------------------------------------------------------------

      1:
      begin
        frmProgresso.AndaFormProgresso(vParam[4]);
        case vParam[6] of
          0: memResult.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' + CtrlBuscaCaP.MessageInfo);
          1: memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' + CtrlBuscaCaP.MessageInfo);
          3: memErro.Lines.Add(FormatDateTime('hh:mm:ss', Now) + ' - ' + CtrlBuscaCaP.MessageInfo);
        end;
      end;

      // -------------------------------------------------------------------------------------------

      2: frmProgresso.EscondeFormProgresso;

      // -------------------------------------------------------------------------------------------
   end;

   Application.ProcessMessages;
   Repaint;
end;



procedure TfrmExecBuscaCaPMT.btnBuscaDocClick(Sender: TObject);
begin
  inherited;

  dtmLookIRRF.MS_DocumentoCaP.Executar;

  if dtmLookIRRF.MS_DocumentoCaP.RetornouValor then
  begin
    Repaint;

    edtCodDocumento.Text    := dtmLookIRRF.MS_DocumentoCaP.ValoresChave[0];
    edtNomeFavorecido.Text  := dtmLookIRRF.MS_DocumentoCaP.ValoresChave[4];
    edtNumDocumento.Text    := dtmLookIRRF.MS_DocumentoCaP.ValoresChave[1] + ' / ' + dtmLookIRRF.MS_DocumentoCaP.ValoresChave[2];
    edtDataLancto.Text      := dtmLookIRRF.MS_DocumentoCaP.ValoresChave[6];
    edtValorDoc.Text        := dtmLookIRRF.MS_DocumentoCaP.ValoresChave[3];
  end;

  Repaint;
end;



procedure TfrmExecBuscaCaPMT.btnLimpaDocClick(Sender: TObject);
begin
  inherited;

  edtCodDocumento.Clear;
  edtNomeFavorecido.Clear;
  edtNumDocumento.Clear;
  edtDataLancto.Clear;
  edtValorDoc.Clear;
end;



procedure TfrmExecBuscaCaPMT.btnConfirmarClick(Sender: TObject);
begin
  IrParaPagina(0);
  inherited;
end;



procedure TfrmExecBuscaCaPMT.btnVoltarClick(Sender: TObject);
begin
  // O inherited precisa ficar comentado: o objetivo é realmente voltar para a 1ª página, para
  // não processar a partir de um dataset (cdsDocumentos) que possa estar apenas em memória
  //  inherited;

  IrParaPagina(0);
  PagControle.OnChange(self);
end;



procedure TfrmExecBuscaCaPMT.dbgINSSTitleButtonClick(Sender: TObject; AFieldName: String);
begin
  inherited;
  cdsDocumento.IndexFieldNames := AFieldName;
end;



procedure TfrmExecBuscaCaPMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CtrlBuscaCaP.Free;
  CtrlNatuRendimento.Free;
end;



end.
