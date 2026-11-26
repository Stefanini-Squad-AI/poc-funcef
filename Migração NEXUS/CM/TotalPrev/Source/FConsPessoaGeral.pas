{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Atender     : WO26508
Responsável : Luis Ferrari
Descrição   : Desfazendo atendimento WO5749, voltando Nome na pesquisa
Data        : 10/10/2025
--------------------------------------------------------------------------------
Pendência   : WO5749
Responsável : Helen Vasquez Bianchi
Data        : 26/04/2024 (merge 08/10/2025)
Descrição   : Retirado o Nome da Pesquisa  'NOME'#9'40'#9'Nome'
--------------------------------------------------------------------------------
Pendência   : SIG 81427
Responsável : Everson Cunha
Descrição   : Inclusão de Hint para melhoria de performance. Conforme solicitado
              pela TMax.
--------------------------------------------------------------------------------
Pendência   : SOL 269137 PPM 1287534
Responsável : Peterson Victor
Descrição   : Erro no Saldo da Reserva retornando informações de mais de uma
              matricula
--------------------------------------------------------------------------------
Pendência   : SOL 161730 KINTANA 1375111
Responsável : Fanuel Junior
Descrição   : Erro nas execuções da regras / queries de entrada na simulação de
              empréstimos para a matr. 9716378.
--------------------------------------------------------------------------------
Pendência   : SOL 161927 KINTANA 1375111
Responsável : Otacilio Aquino
Descrição   : Ajuste para retornar Descricao do Plano Previdenciario.
--------------------------------------------------------------------------------
Pendência   : SOL 141807 Kintana 899893
Responsável : Fernando Santana
Data        : 16/08/2010
Descrição   : Alterado a condição que busca o campo 'CLASSIFICACAO' referente
              aos dependentes
--------------------------------------------------------------------------------
Pendência   : SOL 101247 Kintana 584968
Responsável : Jéssica Lana
Data        : 15/09/2009
Descrição   : Foi alterado no resultado da pesquisa o titulo: Situação para 
              Sit.Patrocinadora e modificado a 'qryres' para trazer o campo
              Sit.Fundação
--------------------------------------------------------------------------------
Pendência   : SOL 127790 Kintana 679947
Responsável : Renato Visoni
Data        : 10/12/2009
Descrição   : Erro ao sair da tela de busca sem realizar buscas.
--------------------------------------------------------------------------------
Pendência   : SOL 116583 Kintana  547369
Responsável : Jéssica Lana
Data        : 13/08/2009
Descrição   : Foi alterado o critério de pesquisa padrão("igual a") no campo
              Matricula (botão 'Atender').
--------------------------------------------------------------------------------
Pendência   : SOL 117575 Kintana 555043
Responsável : Renato Visoni
Data        : 22/05/2009
Descrição   : Ocorria um erro quando o dependente não era localizado pelo Nome
              ou Cpf.
--------------------------------------------------------------------------------
Pendência   : 98836
Responsável : Jéssica Lana
Data        : 17/03/2009
Descrição   : Adicionado o campo Situacaonoplano na qry
--------------------------------------------------------------------------------
Pendência   : SOL 97527  KINTANA 424636
Responsável : Renato Visoni
Data        : 28/01/2009
Descrição   : Apresentar uma critica quando nenhum filtro for informado.
--------------------------------------------------------------------------------
Padrão      : 5.10.19
Pendência   : 26764
Responsável : Daniel Simões
Data        : 11/12/2007
Descrição   : Ajuste na combo que exibe os planos para poder trazer os dados de
              acordo com a matrícula do participante.
--------------------------------------------------------------------------------
Padrão      : 5.10.13
Pendência   : 23992
Data        : 18/12/2006
Responsável : Daniel Simões
Descrição   : Correção na chamada da query da tela de busca Consulta Geral de
              Pessoas. O campo "Situação atual na Fundação" estava preenchendo
              errado. Foi alterado na query de 'DESCRICAO' para 'SITFUND'...
--------------------------------------------------------------------------------
Pendência   : 18686
Data      : 16/05/2005
Responsável : André Pontes
Descrição : Os objetos data-aware (cds, dts, qry e dsp) foram passados para o
            dtmConsPart1, para permitir persistência do resultado da pesquisa.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FConsPessoaGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery, Mask, DBCtrls,
  Grids, Wwdbigrd, Wwdbgrid, DBClient, Provider, uCMClientDataSet;

const
   vQL = #13+#10;

type
   TfrmConsPessoaGeral = class(TfrmSairAjuda)
      pgctrlBusca: TPageControl;
      tbsBusca: TTabSheet;
      pnlInscricao: TPanel;
      Label5: TLabel;
      pnlNome: TPanel;
      Label2: TLabel;
      pnlCPF: TPanel;
      Label3: TLabel;
      cmbInscricao: TComboBox;
      cmbNome: TComboBox;
      cmbCPF: TComboBox;
      edInscricao: TEdit;
      edNome: TEdit;
      edCPF: TEdit;
      ToolbarSep971: TToolbarSep97;
      bbtnBusca: TBitBtn;
      ToolbarSep973: TToolbarSep97;
      tbsResultado: TTabSheet;
      bbtnParticipante: TBitBtn;
      dbgResultado: TwwDBGrid;
      PnlSitFund: TPanel;
      Label4: TLabel;
      CmbSitPlano: TComboBox;
      EdSitPlano: TEdit;
      PnlPlano: TPanel;
      Label6: TLabel;
      CmbPlano: TComboBox;
      edPlano: TEdit;
      PnlPatro: TPanel;
      Label7: TLabel;
      CmbPatro: TComboBox;
      EdPatro: TEdit;
      PnlSitPlano: TPanel;
      Label8: TLabel;
      CmbSitFund: TComboBox;
      EdSitFund: TEdit;
      pnlMatricula: TPanel;
      Label9: TLabel;
      cmbMatricula: TComboBox;
      edMatricula: TEdit;
      pnlSitPatro: TPanel;
      Label1: TLabel;
      cmbSitPatro: TComboBox;
      edSitPatro: TEdit;
      ToolbarSep972: TToolbarSep97;
    chkPlanoAtivo: TCheckBox;

      procedure FormShow(Sender: TObject);
      procedure bbtnBuscaClick(Sender: TObject);
      procedure dbgResultadoDblClick(Sender: TObject);
      procedure bbtnElegivelClick(Sender: TObject);
      procedure pgctrlBuscaChange(Sender: TObject);
      procedure bbtnSairClick(Sender: TObject);
      procedure dbgResultadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dbgResultadoTitleButtonClick(Sender: TObject; AFieldName: String);
    


   private  // Private declarations

      bElegivel      : Boolean;
      bParticipante  : Boolean;
      bDependente    : Boolean;
      bBeneficiario  : Boolean;
      bBenefAss      : Boolean;
      bRecebedor     : Boolean;
      bBenefpp       : Boolean;

      function TextoFiltro(sTexto, sCampo : string; iItem : Integer) : String;
      function ExisteForm(frm: string): Boolean;

   public   // Public declarations

   end;



var
  frmConsPessoaGeral: TfrmConsPessoaGeral;

  cNome, cMatricula, cIdpessoa, cIdPessjur,
  cIdPlanoPrev, cSeqProposta, cIdRgElegBenef,
  cPatro, cSitFund, cIdTitular, cPlano : string;



implementation
{$R *.DFM}
uses
   FTelaAut, fConsPart, uConsPart, dConsPart1;



procedure TfrmConsPessoaGeral.FormShow(Sender: TObject);
begin
  inherited;

   pgctrlBusca.ActivePage      := tbsBusca;

   cmbMatricula.ItemIndex      := 1; // Jéssica L. 116583
   cmbInscricao.ItemIndex      := 1;
   cmbNome.ItemIndex           := 0;
   cmbCPF.ItemIndex            := 0;
   cmbPLANO.ItemIndex          := 0;
   cmbPatro.ItemIndex          := 0;
   cmbSitPlano.ItemIndex       := 0;
   cmbSitFund.ItemIndex        := 0;
   cmbSitPatro.ItemIndex       := 0; // Fernando P. 14590

   bElegivel     := False;
   bParticipante := False;
   bDependente   := False;
   bBeneficiario := False;
   bBenefAss     := False;
   bRecebedor    := False;
   bBenefpp      := False;

   edMatricula.SetFocus;
end;



procedure TfrmConsPessoaGeral.bbtnBuscaClick(Sender: TObject);
var sIdPessoa, sIdPessjur, sFiltro, sSQL : String;
begin
  inherited;

  sSQL           := '';
  cIdpessoa      := '';
  cIdTitular     := '';
  cIdPessjur     := '';
  cIdPlanoPrev   := '';
  cSeqProposta   := '';
  cIdRgElegBenef := '';

  dtmConsPart1.cds.Close;

  //   Início - Tratamento de Busca a partir de Matrícula
  if ( Trim(EdMatricula.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND MATRICULA',EdMatricula.Text,cmbMatricula.ItemIndex);

  if ( Trim(EdInscricao.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND INSCRICAONUMERO',EdInscricao.Text,cmbInscricao.ItemIndex);

  if ( Trim(EdNome.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(NOME)',EdNome.Text,cmbNome.ItemIndex);

  if ( Trim(EdCPF.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND NUMDOCUMENTO',EdCPF.Text,cmbCPF.ItemIndex);

  if ( Trim(EdPlano.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND PLANO',EdPlano.Text,cmbPlano.ItemIndex);

  if ( Trim(EdPatro.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND PATRO',EdPatro.Text,cmbPatro.ItemIndex);

  if ( Trim(EdSitPlano.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(DESCRICAO)',EdSitPlano.Text,cmbSitPlano.ItemIndex);

  if ( Trim(EdSitFund.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(SITFUND)',EdSitFund.Text,cmbSitFund.ItemIndex);

  // Fernando - P.14590 - Inicio
  if ( Trim(EdSitPatro.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(SITPATRO)',EdSitPatro.Text,cmbSitPatro.ItemIndex);
  // Fernando - P.14590 - Fim

  // Marchetti - Pendencia 19135
  if ( chkPlanoAtivo.Checked ) then
     sFiltro := sFiltro+' AND FLGDESATIVADO = 0';
  // Fim Marchetti - Pendencia 19135

  dtmConsPart1.qryRes.DisableControls;

  //Renato Visoni SOL 97527  KINTANA 424636
  if trim(sFiltro) = '' then begin
    if messageBox(Handle,'Não foram selecionado(s) filtro(s) para a busca'+#13#10+'por isso a sua pesquisa pode demorar a ser exibida. Deseja Continuar?','Aviso',mb_iconinformation + mb_YesNo) = id_No then begin
      Exit;
    end;
  end;
  //Fim Renato Visoni


  // Tavares 30/12/2002
  dtmConsPart1.cds.Close;
  dtmConsPart1.qryRes.Close;
  dtmConsPart1.qryRes.SQL.Text := 'SELECT '                                                                                     +
                                  '        IDPESSOA, '                                                                          +vQL+

                                  // Daniel - P: 21551
                                  '        IDSITPART, '                                                                         +vQL+

// Daniel - 23992 --------------------------------------------------------------
                                  '        SITFUND, '                                                                           +vQL+
                                  '        DESCRICAO, ' {SITFUND}                                                               +vQL+
// Daniel - 23992 --------------------------------------------------------------

                                  '        MATRICULADEP, '                                                                      +vQL+
                                  '        EMAIL, '                                                                             +vQL+
                                  '        PLANO, '                                                                             +vQL+
                                  '        IDPLANOPREV, '                                                                       +vQL+
                                  '        SEQPROPOSTA, '                                                                       +vQL+
                                  // Daniel - P: 21551

                                  '        NOME, '                                                                              +vQL+

                                  // Fernando - Pendencia 14472 - Inicio
                                  '        PATRO, '                                                                             +vQL+
                                  // Fernando - Pendencia 14472 - Fim

                                  '        MATRICSHOW AS MATRICULA, '                                                           +vQL+

                                  '        SITPATRO, '                                                                          +vQL+
                                  // Fernando Santana - SOL 141807 Kintana 899893
                                  '        DECODE(IDPESSOA,IDTITULAR,''TITULAR'', CASE WHEN (IDPESSOA <> IDTITULAR AND MATRICULADEP <> MATRICULA) THEN ''BENEFICIARIO'' ELSE ''DEPENDENTE'' END) AS CLASSIFICACAO,'  +vQL+
                                  // Fernando - Pendencia 14591 - Inicio

//                                  '        DECODE(IDPESSOA,IDTITULAR,''TITULAR'',IDPESSOA,''BENEFICIARIO'') AS CLASSIFICACAO, ' +vQL+
                                  // Fernando - Pendencia 14591 - Fim

                                  '        IDPESSJUR, '                                                                         +vQL+
                                  '        IDTITULAR, '                                                                         +vQL+
                                  '        INSCRICAONUMERO, '                                                                   +vQL+
                                  '        NUMDOCUMENTO, '                                                                       +vQL+
                                  '        SITUACAONOPLANO '                                                                       +vQL+   //Jéssica
                                  'FROM VWPARTICIPDEPEN WHERE 1=1 '                                                             +
                                  '                       AND MATRICULADEP IS NOT NULL '                                        + // Bruno Bastos - 10/03/2005
                                  vQL+sFiltro+vQL;

  if ( dtmConsPart1.qryRes.Prepared ) then
    dtmConsPart1.qryRes.UnPrepare;

  dtmConsPart1.qryRes.Prepare;
  dtmConsPart1.cds.Open;

  if (Trim(EdMatricula.Text)<>'') and (dtmConsPart1.cds.IsEmpty) then begin
    sFiltro := '';
    sFiltro := sFiltro+TextoFiltro(' AND MATRICULADEP',EdMatricula.Text,cmbMatricula.ItemIndex);

    if (Trim(EdInscricao.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND INSCRICAONUMERO',EdInscricao.Text,cmbInscricao.ItemIndex);

    if (Trim(EdNome.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND UPPER(NOME)',EdNome.Text,cmbNome.ItemIndex);

    if (Trim(EdCPF.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND NUMDOCUMENTO',EdCPF.Text,cmbCPF.ItemIndex);

    if (Trim(edPlano.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND PLANO',EdPlano.Text,cmbPlano.ItemIndex);

    if (Trim(EdPatro.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND PATRO',EdPatro.Text,cmbPatro.ItemIndex);

    if (Trim(EdSitPlano.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND UPPER(DESCRICAO)',EdSitPlano.Text,cmbSitPlano.ItemIndex);

    if (Trim(EdSitFund.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND UPPER(SITFUND)',EdSitFund.Text,cmbSitFund.ItemIndex);

    // Fernando - P.14590 - Inicio
    if (Trim(EdSitPatro.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND UPPER(SITPATRO)',EdSitPatro.Text,cmbSitPatro.ItemIndex);
    // Fernando - P.14590 - Fim

    // Marchetti - Pendencia 19135
    if ( chkPlanoAtivo.Checked ) then
      sFiltro := sFiltro + ' AND FLGDESATIVADO = 0';
    // Fim Marchetti - Pendencia 19135

    dtmConsPart1.cds.Close;
    dtmConsPart1.qryRes.SQL.Text := 'SELECT '                                                                                     +
                                    ' /*+ leading(E D P) */ ' + //Everson Cunha - SIG81427
                                    '        IDPESSOA, '                                                                          +vQL+

                                    // Daniel - P: 21551
                                    '        IDSITPART, '                                                                         +vQL+
                                    '        SITFUND, ' {Daniel - 23992}                                                          +vQL+
                                    '        DESCRICAO, ' {SITFUND}                                                               +vQL+

                                    '        MATRICULADEP, '                                                                      +vQL+
                                    '        EMAIL, '                                                                             +vQL+
                                    '        PLANO, '                                                                             +vQL+
                                    '        IDPLANOPREV, '                                                                       +vQL+
                                    '        SEQPROPOSTA, '                                                                       +vQL+
                                    // Daniel - P: 21551

                                    '        NOME, '                                                                              +vQL+

                                    // Fernando - Pendencia 14472 - Inicio
                                    '        PATRO, '                                                                             +vQL+
                                    // Fernando - Pendencia 14472 - Fim

                                    '        MATRICSHOW AS MATRICULA, '                                                           +vQL+

                                    // Fernando - Pendencia 14591 - Inicio
                                    '        SITPATRO, '                                                                          +vQL+
                                    '        DECODE(IDPESSOA,IDTITULAR,''TITULAR'',IDPESSOA,''BENEFICIARIO'') AS CLASSIFICACAO, ' +vQL+
                                    // Fernando - Pendencia 14591 - Fim

                                    '        IDPESSJUR, '                                                                         +vQL+
                                    '        IDTITULAR, '                                                                         +vQL+
                                    '        INSCRICAONUMERO, '                                                                   +vQL+
                                    '        NUMDOCUMENTO, '                                                                      +vQL+
                                    '        SITUACAONOPLANO '                                                                    +vQL+  //Jéssica


                                    'FROM VWPARTICIPDEPEN vw WHERE 1=1 '                                                             +
                                    vQL+sFiltro                                                                                   +vQL+
                                    'AND EXISTS (SELECT 1 FROM partprevplan ppp  '+vQL+       //Fanuel Junior SOL161730 Kintana1506426
                                    ' WHERE ppp.idpessjur = vw.IDPESSJUR  '+vQL+
                                    ' AND   ppp.idpessoa = vw.IDTITULAR) '+vQL+
                                    'ORDER BY MATRICULA ';

    if dtmConsPart1.qryRes.Prepared then
      dtmConsPart1.qryRes.UnPrepare;

    dtmConsPart1.qryRes.Prepare;
    dtmConsPart1.cds.Open;
  end;

  // Se nao é um particip/Dependente entao selecina uma pessoa...
  if (dtmConsPart1.cds.IsEmpty) and ((Trim(EdNome.Text)<>'') or (Trim(EdCPF.Text)<>'')) then begin
    sFiltro := '';

    if (Trim(EdNome.Text)<>'') then
      sFiltro := sFiltro+TextoFiltro(' AND NOME',EdNome.Text,cmbNome.ItemIndex);

    if (Trim(edCPF.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND NUMDOCUMENTO',edCPF.Text,cmbCPF.ItemIndex);

    dtmConsPart1.cds.Close;
    dtmConsPart1.qryRes.Close;
    dtmConsPart1.qryRes.SQL.Text := 'SELECT '                          +
                                    '        IDPESSOA,  '              +vQL+
                                    '        NOME,      '              +vQL+

                                    // Daniel - P: 21551
                                    '        0 AS IDSITPART, '     +vQL+

// Daniel - 23992 --------------------------------------------------------------
'        ''                                                  '' AS SITFUND, '     +vQL+
'        ''                                                  '' AS DESCRICAO, '     +vQL+
// Daniel - 23992 --------------------------------------------------------------

                                    // Marchetti - Pendencia 23776
                                    '        ''               '' AS MATRICULADEP, '  +vQL+
                                    // Fim Marchetti - Pendencia 23776
                                    '        EMAIL, '         +vQL+
                                    '        ''                                                  '' AS PLANO, '         +vQL+
                                    '        0 AS IDPLANOPREV, '   +vQL+
                                    // Daniel - P: 21551

                                    // Início - André Tavares - 19/08/2003 - pendência 14871

                                    // Fernando - Pendencia 14472 - Inicio
                                    '        ''                                                  '' AS PATRO,  '        +vQL+
                                    // Fernando - Pendencia 14472 - Fim
                                    '        ''             '' AS MATRICULA, '     +vQL+
                                    '        ''               '' AS MATRICSHOW, '     +vQL+

                                    // Fernando - Pendencia 14591 - Inicio
                                    '        ''                                                            '' AS SITPATRO,  '     +vQL+
                                    '        ''            '' AS CLASSIFICACAO, ' +vQL+
                                    // Fernando - Pendencia 14591 - Fim

                                    // Fim - André Tavares - 19/08/2003 - pendência 14871

                                    '        0 AS SEQPROPOSTA, '         +vQL+
                                    '        0 AS IDPESSJUR, '         +vQL+
                                    '        0 AS IDTITULAR, '         +vQL+
                                    '        0 AS INSCRICAONUMERO, '   +vQL+
                                    '        '' '' AS SITUACAONOPLANO, '   +vQL+ // Renato Visoni SOL 117575 Kintana 555043
                                    '        NUMDOCUMENTO     '        +vQL+
                                    'FROM PESSOA '                     +
                                    'WHERE 1 = 1 '                     +
                                    sFiltro;

    if dtmConsPart1.qryRes.Prepared then
      dtmConsPart1.qryRes.UnPrepare;

    dtmConsPart1.qryRes.Prepare;
    dtmConsPart1.cds.Open;
  end;


  //Renato Visoni SOL 127790 Kintana 679947
  try
    dtmConsPart1.dsRes.DataSet := dtmConsPart1.cds;
    dbgResultado.DataSource    := dtmConsPart1.dsRes;
  except
  end;
  //Renato Visoni SOL 127790 Kintana 679947


  dtmConsPart1.qryRes.EnableControls;
  pgctrlBusca.ActivePage   := tbsResultado;
  bbtnParticipante.Enabled := not(dtmConsPart1.qryRes.IsEmpty);
  pgctrlBuscaChange(Sender);
end;

function TfrmConsPessoaGeral.TextoFiltro(sTexto, sCampo: string; iItem: Integer): String;
begin
   case iItem of
      0 : TextoFiltro := sTexto +' LIKE '''+Trim(sCampo)+'%''';
      1 : TextoFiltro := sTexto +' =    '''+Trim(sCampo)+'''';
      2 : TextoFiltro := sTexto +' LIKE ''%'+Trim(sCampo)+'%''';
   end;
end;



procedure TfrmConsPessoaGeral.dbgResultadoDblClick(Sender: TObject);
begin
   inherited;
   bbtnElegivelClick(sender);
end;



procedure TfrmConsPessoaGeral.bbtnElegivelClick(Sender: TObject);
var
   iIdPessoa : Integer;
begin
   inherited;

   if dtmConsPart1.cds.FieldByName('IDPESSOA').AsString <>  '' then
   begin
      cIdpessoa    := dtmConsPart1.cds.FieldByName('IDPESSOA').AsString;
      cIdPessjur   := dtmConsPart1.cds.FieldByName('IDPESSJUR').AsString;
      cIdTitular   := dtmConsPart1.cds.FieldByName('IDTITULAR').AsString;
      cIdPlanoPrev := dtmConsPart1.cds.FieldByName('IDPLANOPREV').AsString; // Daniel - 26764
      //Otacilio Aquino SOL 161927  KINTANA 1375111
      cPlano       := dtmConsPart1.cds.FieldByName('PLANO').AsString;
      cMatricula   := dtmConsPart1.cds.FieldByName('MATRICULA').AsString // Peterson Victor SOL 269137 PPM 1287534
   end;

   frmConsPessoaGeral.ModalResult := mrOK;
end;



procedure TfrmConsPessoaGeral.pgctrlBuscaChange(Sender: TObject);
begin
   inherited;

   bbtnBusca.Enabled        := pgctrlBusca.activePage = tbsBusca;
   bbtnParticipante.Enabled := pgctrlBusca.activePage = tbsResultado;

   if pgctrlBusca.activePage = tbsBusca then bbtnBusca.setFocus;
   if pgctrlBusca.activePage = tbsResultado then dbgResultado.setFocus;
end;



function TfrmConsPessoaGeral.ExisteForm(frm: string): Boolean;
var
   i: Integer;
begin
   Result := False;

   for i := 0 to Screen.FormCount - 1 do
   begin
      if uppercase(Screen.Forms[i].Name) = uppercase(frm) then
      begin
         Result := True;
         Break;
      end;
   end;
end;


procedure TfrmConsPessoaGeral.bbtnSairClick(Sender: TObject);
begin
   frmConsPessoaGeral.ModalResult := mrCancel;
   cIdpessoa := '';

   inherited;
end;



procedure TfrmConsPessoaGeral.dbgResultadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;
   if key = vk_return then bbtnElegivelClick(sender);
end;



procedure TfrmConsPessoaGeral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;



procedure TfrmConsPessoaGeral.dbgResultadoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;

   dtmConsPart1.cds.IndexName        := 'CHANGEINDEX';
   dtmConsPart1.cds.IndexFieldNames  := AFieldName;
end;



end.







