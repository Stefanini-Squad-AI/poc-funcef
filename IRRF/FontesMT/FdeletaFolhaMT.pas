{ Alterações
*******************************************************************************
Analista.: William Moreira da Silva
SOL......: 27632
Data.....: 23/08/2015
Rotina...: Todas
Descrição: Alterar nome do menu, e desabilitar combo "Folha de Beneficios" (.DFM)
**********************************************************************
Analista...: edilaine Ferraresi
N. Sol.....: 208308-15657
N. Kintana.: 2058286
Data.......: 28/04/2014
Rotina.....: .dfm, varias funcionalidades (rgSistema.itemindex)
Descrição..: restringir acesso do usuário a funcionalidade
**********************************************************************
Analista....: Brunno Mattos
Sol_Kintana.: 137153_826536
Data........: 24/08/2010
Rotina......: DeletaLancFolha
Descrição...: Foram exlcluídos o groupBox gbxFavorecido com os campos "edCPFFavPA",
              "edNomeFavPA" e "edtListaPessoa" do form, estes substituidos pelo frame
              "frmFrameListaBenef" da BPL CMIRRFobj50. Dessa forma o último parâmetro
              foi alterado para passar a função o IDLISTA, de modo que apenas os beneficiários
              contidos na lista tenhão a busca desfeita.
**********************************************************************
Analista...: Marcos Luiz de Jesus
N. Sol.....: 138091
N. Kintana.: 837526
Data.......: 17/06/2010
Rotina.....: Tela
Descrição..: Deixar o campo CPF somente leitura. O preenchimento do campo deverá ser através do componente MONTASELECT
**********************************************************************
Analista.: Bruno Bastos
Pendencia: Sem Pendência
Data.....: 08/11/2006
Rotina...: Tela
Descrição: Na qryVersoes concatenei no campo historico também o campo idhstfolhabenef.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 19153
Data.....: 04/10/2006
Rotina...: bbtnConfirmaGeracaoClick
Descrição: Passar o idpessoa para a rotina de deleção da uCtrlDeletaFolha.
**********************************************************************
Analista.: Bruno Bastos
Pendencia: 18883
Data.....: 27/03/2006
Rotina...: Várias
Descrição: Permitir desfazer busca filtrando o código da natureza de rendimento.
           Remodelagem da tela.
**********************************************************************
}

unit FdeletaFolhaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  Spin, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls,
  TB97Tlbr, TB97, wwdblook, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  MontaSelect, uCtrlDeletaFolha, DBTables, uCtrlNatuRendimento, fFrameLista;

type
  TfrmdeletaFolhaMT = class(TfrmSairAjuda)
    bbtnConfirmaGeracao: TBitBtn;
    Panel1: TPanel;
    gbPeriodo: TGroupBox;
    bbtnCancelar: TBitBtn;
    dsVersoes: TDataSource;
    qryVersoes: TQuery;
    MontaSelectBenef: TMontaSelect;
    pnlPosicao: TPanel;
    rdbData: TRadioButton;
    rdbVersao: TRadioButton;
    pnlData: TPanel;
    grbPeriodoVersao: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    pnlVersaoPagto: TPanel;
    gbxVersao: TGroupBox;
    dblcNatureza: TwwDBLookupCombo;
    rdgNatureza: TRadioGroup;
    cdsNaturRendimento: TCMClientDataSet;
    dblcNatRendimento: TwwDBLookupCombo;
    frmFrameListaBenef: TfrmFrameListaBenef;
    rgSistema: TGroupBox;
    rbDesfazFlPagto: TRadioButton;
    rbDesfazFlBenef: TRadioButton;
    procedure rgSistemaClick(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnAddFavClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcNaturezaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dtInicioCloseUp(Sender: TObject);
    procedure dtFimCloseUp(Sender: TObject);
    procedure dblcNaturezaChange(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure rdbDataClick(Sender: TObject);
    procedure rdbVersaoClick(Sender: TObject);
    procedure rdgNaturezaClick(Sender: TObject);
    function HabilitaBotao: Boolean;
    procedure dblcNatRendimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure rbDesfazFlPagtoClick(Sender: TObject);

  private
    DeletaFolha : TCtrlDeletaFolha;
    NatuRendimento : TCtrlNaturendimento;

  public
    { Public declarations }


  end;

var
  frmdeletaFolhaMT: TfrmdeletaFolhaMT;

implementation

{$R *.DFM}
uses umensErro, uSistema, uDataBase,  DbaseDados;

procedure TfrmdeletaFolhaMT.rgSistemaClick(Sender: TObject);
begin
  // edilaine - SOL 208308-15657 / KTN 2058286 - comentado
  {inherited;
  If rgSistema.ItemIndex = 0 Then
  Begin
    rdbData.Checked := True;
    pnlVersaoPagto.SendToBack;
    dblcNatureza.Clear;
  End;
  bbtnConfirmaGeracao.Enabled := HabilitaBotao;
  }// edilaine - SOL 208308-15657 / KTN 2058286 - fim
end;

procedure TfrmdeletaFolhaMT.bbtnConfirmaGeracaoClick(Sender: TObject);
var
  Ano, Mes, Dia : word;
  iVersao, iPessoa : Integer;
  sMsg, sCodNatureza : String;
  iOpSistema         : integer;    // edilaine - SOL 208308-15657 / KTN 2058286
begin
  inherited;
  sCodNatureza := '';

  sMsg := 'Deseja realmente apagar a geração das Folhas para os parâmetros selecionados ?';

  if (rbDesfazFlBenef.Checked {rgSistema.ItemIndex = 1}) and (rdbData.Checked) Then  // edilaine - SOL 208308-15657 / KTN 2058286
    sMsg := 'As opções selecionadas vão apagar todas as versões de pagamento da Folha de Beneficios para o período selecionado. Confirma?';

  if MsgDlg(sMsg, 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then 
  begin
    // edilaine - SOL 208308-15657 / KTN 2058286 - inicio
    if rbDesfazFlPagto.Checked then
       iOpSistema := 0
    else if rbDesfazFlBenef.Checked then
       iOpSistema := 1;
    // edilaine - SOL 208308-15657 / KTN 2058286 - fim

    {Gera o arquivo Txt no caminho especificado}
    DecodeDate(dtInicio.DateTime, Ano, Mes, Dia);
    bbtnConfirmaGeracao.enabled := True;
    if dtFim.Date < dtInicio.date then
    Begin
      MsgDlg('Data final não pode ser menor que a inicial.','Aviso',mtWarning,[mbOK],0);
      dtFim.date := dtInicio.date;
      dtInicio.text := '';
      dtFim.text    := '';
      bbtnConfirmaGeracao.enabled := false;
      exit;
    end;

    If ((dtInicio.text <> '') and (dtFim.text <> '')) then
    begin
      iVersao := 0;
    end
    else
    begin
      iVersao := qryVersoes.fieldbyname('IDHSTFOLHABENEF').asInteger;
    end;

    if (MontaSelectBenef.ValoresChave.Count > 0) then
      iPessoa := StrtoInt(MontaselectBenef.Valoreschave[0])
    else
      iPessoa := 0;

    If rdgNatureza.ItemIndex = 1 Then
    Begin
      If Trim(dblcNatRendimento.Text) = '' Then
      Begin
        MsgDlg('Selecione uma natureza de rendimento.', 'Aviso', mtWarning, [mbOK], 0);
        bbtnConfirmaGeracao.enabled := false;
        exit;
      End
      Else
        sCodNatureza := dblcNatRendimento.LookupValue;
    End;

    If (frmFrameListaBenef.qryLista.isEmpty) then //Brunno Mattos - SOL:137153_ KTN:826536
        frmFrameListaBenef.ListaUsuario := 0;

    if not DeletaFolha.DeletaLancFolha(sistema.IdEmpresa, iOpSistema {rgSistema.ItemIndex}, iversao, ipessoa,
                                       sCodNatureza, dtInicio.text, dtFim.text, frmFrameListaBenef.ListaUsuario) then  // edilaine - SOL 208308-15657 / KTN 2058286
      MsgDlg(DeletaFolha.MessageInfo,'Aviso',mtWarning,[mbOK],0)
    else
    Begin
      bbtnConfirmaGeracao.enabled := false;
      If (Copy(pnlPosicao.caption,1,1) <> '>') then
        MsgDlg('Operação efetuada com sucesso!','Aviso',mtWarning,[mbOK],0);
    End;
  end;
end;

procedure TfrmdeletaFolhaMT.FormCreate(Sender: TObject);
begin
  inherited;
  DeletaFolha := TCtrlDeletaFolha.create;
  DeletaFolha.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  NatuRendimento := TCtrlNatuRendimento.create;
  NatuRendimento.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  cdsNaturRendimento.Data := NatuRendimento.ListNaturendimento
end;

procedure TfrmdeletaFolhaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmaGeracao.enabled := false;
  dblcNatureza.LookupValue    := '';
  dtInicio.text               := '';
  dtFim.text                  := '';
  pnlPosicao.Caption          := '';
  repaint;
end;

procedure TfrmdeletaFolhaMT.sbtnAddFavClick(Sender: TObject);
begin
  inherited;

  if (rbDesfazFlBenef.Checked {rgSistema.ItemIndex = 1}) and (dblcNatureza.Text = '') then  // edilaine - SOL 208308-15657 / KTN 2058286
  begin
       MsgDlg('Primeiro selecionar uma versão !!','Aviso',mtWarning,[mbOK],0);
  end
  else
  begin
      MontaselectBenef.Filtro.clear;
      if (rbDesfazFlBenef.Checked {rgSistema.ItemIndex = 1}) then   // edilaine - SOL 208308-15657 / KTN 2058286
      begin
         MontaselectBenef.Filtro.add (' ( HISTRUBSAL.IDMODULO = 18 ) ');
         MontaselectBenef.Filtro.add (' ( HISTRUBSAL.IDHSTFOLHABENEF = '+qryVersoes.fieldbyname('IDHSTFOLHABENEF').asstring+ ' ) ');
         MontaselectBenef.Filtro.add (' ( HISTRUBSAL.IDTITULAR = DEPENTIT.IDTITULAR ) ');
      end
      else
         MontaselectBenef.Filtro.add (' ( HISTRUBSAL.IDMODULO = 21 ) ');

      MontaselectBenef.Filtro.add (' ( HISTRUBSAL.IDLANCIRRF IS NOT NULL) ');
      MontaselectBenef.Filtro.add (' ( HISTRUBSAL.IDPESSOA = DEPENTIT.IDPESSOA ) ');   
      MontaselectBenef.Filtro.add (' ( DEPENTIT.IDPESSOA = PESSOA.IDPESSOA ) ');

      MontaSelectBenef.Executar;

  end;

end;

procedure TfrmdeletaFolhaMT.FormShow(Sender: TObject);
begin
  inherited;

  // edilaine - SOL 208308-15657 / KTN 2058286 - inicio
  if (rbDesfazFlPagto.Enabled) and (not rbDesfazFlBenef.Enabled) then
     rbDesfazFlPagto.Checked := true
  else if ((rbDesfazFlBenef.Enabled) and (not rbDesfazFlPagto.Enabled)) or ((rbDesfazFlPagto.Enabled) and (rbDesfazFlBenef.Enabled)) then
     rbDesfazFlBenef.Checked := true;
  {rgSistemaClick(self); }
  
  bbtnConfirmaGeracao.Enabled := (rbDesfazFlPagto.Enabled) or (rbDesfazFlBenef.Enabled);
  // edilaine - SOL 208308-15657 / KTN 2058286 - fim

  qryVersoes.open;
  frmFrameListaBenef.DefineLista(0); //Brunno Mattos - SOL:137153_ KTN:826536
end;

procedure TfrmdeletaFolhaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryVersoes.close;
  NatuRendimento.Free;
  DeletaFolha.Free;
end;




procedure TfrmdeletaFolhaMT.dblcNaturezaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  dtInicio.text := '';
  dtFim.Text    := '';
  bbtnConfirmaGeracao.enabled := HabilitaBotao;
end;

procedure TfrmdeletaFolhaMT.dtInicioCloseUp(Sender: TObject);
begin
  inherited;
  dblcnatureza.text := '';
  bbtnConfirmaGeracao.Enabled := HabilitaBotao;
end;

procedure TfrmdeletaFolhaMT.dtFimCloseUp(Sender: TObject);
begin
  inherited;
  dblcnatureza.text := '';
  bbtnConfirmaGeracao.Enabled := HabilitaBotao;
end;

procedure TfrmdeletaFolhaMT.dblcNaturezaChange(Sender: TObject);
begin
  inherited;
  If dblcNatureza.text = '' then
     bbtnConfirmaGeracao.enabled := false;
end;

procedure TfrmdeletaFolhaMT.cbMesChange(Sender: TObject);
begin
  inherited;
  If ((dtInicio.text <> '') and (dtFim.Text <> '')) then
   bbtnConfirmaGeracao.enabled := true
  else
    bbtnConfirmaGeracao.enabled := false;
end;

procedure TfrmdeletaFolhaMT.rdbDataClick(Sender: TObject);
begin
  inherited;
  If rbDesfazFlBenef.Checked {rgSistema.ItemIndex = 1} Then   // edilaine - SOL 208308-15657 / KTN 2058286
  Begin
    If rdbData.Checked Then
    Begin
      rdbVersao.Checked := False;
      pnlVersaoPagto.SendToBack;
      dblcNatureza.Clear;
    End
    Else
    Begin
      rdbVersao.Checked := True;
      pnlData.SendToBack;
      dtInicio.Clear;
      dtFim.Clear;
    End;
  End
  Else
  Begin
    rdbData.Checked := True;
    pnlVersaoPagto.SendToBack;
    dblcNatureza.Clear;
  End;
  bbtnConfirmaGeracao.Enabled := HabilitaBotao;
end;

procedure TfrmdeletaFolhaMT.rdbVersaoClick(Sender: TObject);
begin
  inherited;
  If rbDesfazFlBenef.Checked {rgSistema.ItemIndex = 1} Then   // edilaine - SOL 208308-15657 / KTN 2058286
  Begin
    If rdbVersao.Checked Then
    Begin
      rdbData.Checked := False;
      pnlData.SendToBack;
      dtInicio.Clear;
      dtFim.Clear;
    End
    Else
    Begin
      rdbData.Checked := True;
      pnlVersaoPagto.SendToBack;
      dblcNatureza.Clear;
    End;
  End
  Else
  Begin
    rdbData.Checked := True;
    pnlVersaoPagto.SendToBack;
    dblcNatureza.Clear;
  End;
  bbtnConfirmaGeracao.Enabled := HabilitaBotao;
end;

procedure TfrmdeletaFolhaMT.rdgNaturezaClick(Sender: TObject);
begin
  inherited;
  If rdgNatureza.ItemIndex = 1 Then
    dblcNatRendimento.Visible := True
  Else
  Begin
    dblcNatRendimento.Visible := False;
    dblcNatRendimento.Clear;
  End;
  bbtnConfirmaGeracao.Enabled := HabilitaBotao;
end;

function TfrmdeletaFolhaMT.HabilitaBotao: Boolean;
begin
  Result := False;
  If (
      (
       (rbDesfazFlPagto.Checked {rgSistema.ItemIndex = 0}) And           // edilaine - SOL 208308-15657 / KTN 2058286
       ((dtInicio.Text <> '') And (dtFim.Text <> '')) And
       ((rdgNatureza.ItemIndex = 0) or
        (rdgNatureza.ItemIndex = 1) And (dblcNatRendimento.Text <> ''))
      ) or
      (
       (rbDesfazFlBenef.Checked {rbrgSistema.ItemIndex = 1}) And         // edilaine - SOL 208308-15657 / KTN 2058286
       (rdbData.Checked) And
       ((dtInicio.Text <> '') And (dtFim.Text <> '')) And
       ((rdgNatureza.ItemIndex = 0) or
        (rdgNatureza.ItemIndex = 1) And (dblcNatRendimento.Text <> ''))
      ) or
      (
       (rbDesfazFlBenef.Checked {rgSistema.ItemIndex = 1}) And           // edilaine - SOL 208308-15657 / KTN 2058286
       (rdbVersao.Checked) And
       (dblcNatureza.Text <> '') And
       ((rdgNatureza.ItemIndex = 0) or
        (rdgNatureza.ItemIndex = 1) And (dblcNatRendimento.Text <> ''))
      )
     )  Then
    Result := True;
end;

procedure TfrmdeletaFolhaMT.dblcNatRendimentoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  bbtnConfirmaGeracao.Enabled := HabilitaBotao;
end;


procedure TfrmdeletaFolhaMT.rbDesfazFlPagtoClick(Sender: TObject);
begin
  inherited;
  If rbDesfazFlPagto.Checked {rgSistema.ItemIndex = 0} Then   // edilaine - SOL 208308-15657 / KTN 2058286
  Begin
    rdbData.Checked := True;
    pnlVersaoPagto.SendToBack;
    dblcNatureza.Clear;
  End;
  bbtnConfirmaGeracao.Enabled := HabilitaBotao;
end;

end.



