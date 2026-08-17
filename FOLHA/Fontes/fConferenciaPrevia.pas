unit fConferenciaPrevia;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 16/01/2006
// Rotina      : CmeCadastroFind
// Pendência   : 23923
// Descricao   : Implementar crítica de lançamentos na Tmpdesc não processados
//   para as pessoas constantes na Prévia de pagamento do lote selecionado
//   na tela.
//------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls, USistema, UMensErro,
  uAdmPrevFB, ComCtrls, Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmConferenciaPrevia = class(TfrmCadastroCS)
    pnlLote: TPanel;
    lblLote: TLabel;
    lblMes: TLabel;
    dbtMesReferencia: TDBText;
    lbltTipoLote: TLabel;
    lbltEstadoLote: TLabel;
    lblPreechimento: TLabel;
    qryAux: TwwQuery;
    lblTipoLote: TLabel;
    lblEstadoLote: TLabel;
    lblDescricaoLote: TLabel;
    PageControl1: TPageControl;
    tbsPreenchimento: TTabSheet;
    ScrollBox1: TScrollBox;
    pnlPergunta1: TPanel;
    lblPergunta1: TLabel;
    cbResp1: TComboBox;
    pnlPergunta2: TPanel;
    lblPergunta2: TLabel;
    cbResp2: TComboBox;
    pnlPergunta3: TPanel;
    lblPergunta3: TLabel;
    cbResp3: TComboBox;
    pnlPergunta4: TPanel;
    lblPergunta4: TLabel;
    cbResp4: TComboBox;
    pnlPergunta4a: TPanel;
    lblPergunta4a: TLabel;
    cbResp4a: TComboBox;
    pnlPergunta5: TPanel;
    lblPergunta5: TLabel;
    cbResp5: TComboBox;
    pnlPergunta6: TPanel;
    lblPergunta6: TLabel;
    cbResp6: TComboBox;
    pnlPergunta7: TPanel;
    lblPergunta7: TLabel;
    cbResp7: TComboBox;
    pnlPergunta8: TPanel;
    lblPergunta8: TLabel;
    cbResp8: TComboBox;
    pnlPergunta9: TPanel;
    lblPergunta9: TLabel;
    cbResp9: TComboBox;
    pnlPergunta10: TPanel;
    lblPergunta10: TLabel;
    cbResp10: TComboBox;
    pnlPergunta11: TPanel;
    lblPergunta11: TLabel;
    cbResp11: TComboBox;
    pnlPergunta12: TPanel;
    lblPergunta12: TLabel;
    cbResp12: TComboBox;
    pnlPergunta13: TPanel;
    lblPergunta13: TLabel;
    cbResp13: TComboBox;
    pnlPergunta14: TPanel;
    lblPergunta14: TLabel;
    cbResp14: TComboBox;
    pnlPergunta15: TPanel;
    lblPergunta15: TLabel;
    cbResp15: TComboBox;
    tbsTmpdesc: TTabSheet;
    lblMsgTmpdesc: TLabel;
    dbgTmpdesc: TwwDBGrid;
    dsTmpdesc: TwwDataSource;
    qryTmpdesc: TwwQuery;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFlgConcessao: integer;
    FFlgTipoFolha: integer;
    FRespChklist: string;
    FUsuChklist: string;
    FDtChklist: tdatetime;
    FFlgVoltaTmp: integer;
    FIdLote: integer;
    procedure SetDtChklist(const Value: tdatetime);
    procedure SetFlgConcessao(const Value: integer);
    procedure SetFlgTipoFolha(const Value: integer);
    procedure SetRespChklist(const Value: string);
    procedure SetUsuChklist(const Value: string);
    procedure SetFlgVoltaTmp(const Value: integer);
    procedure SetIdLote(const Value: integer);
    { Private declarations }
    function PegaRespComponente(compo: TComboBox): string;
    //pega o valor da resposta no componente e coloca na string de respostas.
    procedure SetaRespComponente(sResp: string; iposicao: integer; compo: TComboBox);
    //seta o componente com o valor inicial do string de respostas
    procedure LimpaPreenchimento;
    procedure ConfiguraRespostaPadrao;
  public
    { Public declarations }
    property IdLote: integer read FIdLote write SetIdLote;
    property FlgVoltaTmp: integer read FFlgVoltaTmp write SetFlgVoltaTmp;
    property FlgConcessao: integer read FFlgConcessao write SetFlgConcessao;
    property FlgTipoFolha: integer read FFlgTipoFolha write SetFlgTipoFolha;
    property RespChklist: string read FRespChklist write SetRespChklist;
    property UsuChklist: string read FUsuChklist write SetUsuChklist;
    property DtChklist: tdatetime read FDtChklist write SetDtChklist;
  end;

var
  frmConferenciaPrevia: TfrmConferenciaPrevia;

implementation

uses fAguarde;

{$R *.DFM}

procedure TfrmConferenciaPrevia.LimpaPreenchimento;
begin
  cbResp1.text:='';
  cbResp2.text:='';
  cbResp3.text:='';
  cbResp4.text:='';
  cbResp4a.text:='';
  cbResp5.text:='';
  cbResp6.text:='';
  cbResp7.text:='';
  cbResp8.text:='';
  cbResp9.text:='';
  cbResp10.text:='';
  cbResp11.text:='';
  cbResp12.text:='';
  cbResp13.text:='';
  cbResp14.text:='';
  cbResp15.text:='';
  cbResp1.itemindex:=-1;
  cbResp2.itemindex:=-1;
  cbResp3.itemindex:=-1;
  cbResp4.itemindex:=-1;
  cbResp4a.itemindex:=-1;
  cbResp5.itemindex:=-1;
  cbResp6.itemindex:=-1;
  cbResp7.itemindex:=-1;
  cbResp8.itemindex:=-1;
  cbResp9.itemindex:=-1;
  cbResp10.itemindex:=-1;
  cbResp11.itemindex:=-1;
  cbResp12.itemindex:=-1;
  cbResp13.itemindex:=-1;
  cbResp14.itemindex:=-1;
  cbResp15.itemindex:=-1;
end;

procedure TfrmConferenciaPrevia.ConfiguraRespostaPadrao;
begin
  if pnlPergunta1.visible then
  begin
    SetaRespComponente(RespChklist, 2, cbResp1);
  end
  else
  begin
    cbResp1.itemindex:=0;
  end;
  if pnlPergunta2.visible then
  begin
    SetaRespComponente(RespChklist, 3, cbResp2);
  end
  else
  begin
    cbResp2.itemindex:=0;
  end;
  if pnlPergunta3.visible then
  begin
    SetaRespComponente(RespChklist, 4, cbResp3);
  end
  else
  begin
    cbResp3.itemindex:=0;
  end;
  if pnlPergunta4.visible then
  begin
    SetaRespComponente(RespChklist, 5, cbResp4);
  end
  else
  begin
    cbResp4.itemindex:=0;
  end;
  if pnlPergunta4a.visible then
  begin
    SetaRespComponente(RespChklist, 17, cbResp4a);
  end
  else
  begin
    cbResp4a.itemindex:=0;
  end;
  if pnlPergunta5.visible then
  begin
    SetaRespComponente(RespChklist, 6, cbResp5);
  end
  else
  begin
    cbResp5.itemindex:=0;
  end;
  if pnlPergunta6.visible then
  begin
    SetaRespComponente(RespChklist, 7, cbResp6);
  end
  else
  begin
    cbResp6.itemindex:=0;
  end;
  if pnlPergunta7.visible then
  begin
    SetaRespComponente(RespChklist, 8, cbResp7);
  end
  else
  begin
    cbResp7.itemindex:=0;
  end;
  if pnlPergunta8.visible then
  begin
    SetaRespComponente(RespChklist, 9, cbResp8);
  end
  else
  begin
    cbResp8.itemindex:=0;
  end;
  if pnlPergunta9.visible then
  begin
    SetaRespComponente(RespChklist, 10, cbResp9);
  end
  else
  begin
    cbResp9.itemindex:=0;
  end;
  if pnlPergunta10.visible then
  begin
    SetaRespComponente(RespChklist, 11, cbResp10);
  end
  else
  begin
    cbResp10.itemindex:=0;
  end;
  if pnlPergunta11.visible then
  begin
    SetaRespComponente(RespChklist, 12, cbResp11);
  end
  else
  begin
    cbResp11.itemindex:=0;
  end;
  if pnlPergunta12.visible then
  begin
    SetaRespComponente(RespChklist, 13, cbResp12);
  end
  else
  begin
    cbResp12.itemindex:=0;
  end;
  if pnlPergunta13.visible then
  begin
    SetaRespComponente(RespChklist, 14, cbResp13);
  end
  else
  begin
    cbResp13.itemindex:=0;
  end;
  if pnlPergunta14.visible then
  begin
    SetaRespComponente(RespChklist, 15, cbResp14);
  end
  else
  begin
    cbResp14.itemindex:=0;
  end;
  if pnlPergunta15.visible then
  begin
    SetaRespComponente(RespChklist, 16, cbResp15);
  end
  else
  begin
    cbResp15.itemindex:=0;
  end;
end;

procedure TfrmConferenciaPrevia.CmeCadastroFind(Sender: TObject);
 var saux: string;
     iconvertido: integer;
begin
  inherited;
  qry.close;
  lblDescricaoLote.caption:='';
  lblTipoLote.caption:='';
  lblEstadoLote.caption:='';
  lblPreechimento.caption:='Preenchimento:';
  LimpaPreenchimento;
  pnlPergunta1.visible:=false;
  pnlPergunta2.visible:=false;
  pnlPergunta3.visible:=false;
  pnlPergunta4.visible:=false;
  pnlPergunta4a.visible:=false;
  pnlPergunta5.visible:=false;
  pnlPergunta6.visible:=false;
  pnlPergunta7.visible:=false;
  pnlPergunta8.visible:=false;
  pnlPergunta9.visible:=false;
  pnlPergunta10.visible:=false;
  pnlPergunta11.visible:=false;
  pnlPergunta12.visible:=false;
  pnlPergunta13.visible:=false;
  pnlPergunta14.visible:=false;
  pnlPergunta15.visible:=false;
  if MontaSelect.RetornouValor then
  begin
    qry.parambyname('pidlote').asinteger:=strtoint(MontaSelect.ValoresChave[0]);
    qry.open;
    lblDescricaoLote.caption:=qry.FieldByName('IDLOTE').asstring+' - '+
      qry.FieldByName('DESCRICAO').asstring;
    IdLote:=qry.FieldByName('IDLOTE').asinteger;
    FlgVoltaTmp:=qry.FieldByName('FLGVOLTATMP').asinteger;
    FlgConcessao:=qry.FieldByName('FLGCONCESSAO').asinteger;
    FlgTipoFolha:=qry.FieldByName('FLGTIPOFOLHA').asinteger;
    RespChklist:=qry.FieldByName('RESPCHKLIST').asstring;
    UsuChklist:=qry.FieldByName('USUCHKLIST').asstring;
    DtChklist:=qry.FieldByName('DTCHKLIST').asdatetime;
    case FlgTipoFolha of
      0: begin
           if FlgConcessao = 0 then
           begin
             iconvertido:=0;
             saux:='Folha Normal Manut.';
           end
           else
           begin
             iconvertido:=1;
             saux:='Folha Normal Concessão';
             //verifica se é folha de pagamento único.
             qryaux.close;
             qryaux.sql.clear;
             qryaux.sql.Add(
               'SELECT 1 '+
               'FROM HSTBENEFBFCIARIO H, BENEFBFCIARIO BB, TPPAGTOBENEFICIO TPB '+
               'WHERE H.IDLOTE = '+inttostr(IdLote)+' '+
               'AND BB.NUMEROPROCESSO = H.NUMEROPROCESSO '+
               'AND BB.IDTITULAR = H.IDTITULAR '+
               'AND BB.IDPESSOA = H.IDPESSOA '+
               'AND BB.IDPESSJUR = H.IDPESSJUR '+
               'AND BB.IDPLANOPREV = H.IDPLANOPREV '+
               'AND BB.IDBENEFICIO = H.IDBENEFICIO '+
               'AND BB.SEQPROPOSTA = H.SEQPROPOSTA '+
               'AND BB.FLGFORMAPAGTO = ''F'' '+
               'AND TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC '+
               'AND TPB.FLGFREQUENCIA = ''U''');
             qryaux.open;
             if not qryaux.isempty then
               iconvertido:=2;
           end;
         end;
      1: begin
           saux:='Pagamento Pendente';
           iconvertido:=3;
         end;
      2: begin
           saux:='Folha Extra';
           iconvertido:=4;
         end;
      3: begin
           saux:='Folha de Abono';
           iconvertido:=5;
         end;
      4: begin
           saux:='Folha de Antec. Abono';
           iconvertido:=6;
         end;
      5: begin
           saux:='Exclusões Efetivação';
           iconvertido:=7;
         end;
      6: begin
           saux:='Reprocessamento';
           iconvertido:=8;
         end;
    end;
    lblTipoLote.caption:=saux;
    if FlgVoltaTmp = 0 then
      lblEstadoLote.caption:='Para Efetivar'
    else
      lblEstadoLote.caption:='Efetivado';
    if copy(RespChklist,1,1) = '1' then
    begin
      {qryaux.close;
      qryaux.sql.clear;
      qryaux.sql.Add(
        'SELECT NOME '+
        'FROM PESSOA '+
        'WHERE IDPESSOA = '+copy(UsuChklist,3,30));
      qryaux.open;}
      lblPreechimento.caption:='Preenchido por '+
        {qryAux.fieldbyname('nome').asstring}UsuChklist+' em '+
        formatdatetime('dd/mm/yyyy hh:mm:ss', DtChklist);
    end
    else
      lblPreechimento.caption:='';
    if FlgVoltaTmp = 0 then
    begin
      sbtnAlterar.caption:='Alterar';
      if lblPreechimento.caption = '' then
        lblPreechimento.caption:='Preenchimento a ser realizado'
    end
    else
    begin
      sbtnAlterar.caption:='Consultar';
      if lblPreechimento.caption = '' then
        lblPreechimento.caption:='Preenchimento não pode ser alterado'
      else
        lblPreechimento.caption:=lblPreechimento.caption+' (Não pode ser alterado)';
    end;
    cbResp1.enabled:=sbtnAlterar.caption='Alterar';
    cbResp2.enabled:=sbtnAlterar.caption='Alterar';
    cbResp3.enabled:=sbtnAlterar.caption='Alterar';
    cbResp4.enabled:=sbtnAlterar.caption='Alterar';
    cbResp4a.enabled:=sbtnAlterar.caption='Alterar';
    cbResp5.enabled:=sbtnAlterar.caption='Alterar';
    cbResp6.enabled:=sbtnAlterar.caption='Alterar';
    cbResp7.enabled:=sbtnAlterar.caption='Alterar';
    cbResp8.enabled:=sbtnAlterar.caption='Alterar';
    cbResp9.enabled:=sbtnAlterar.caption='Alterar';
    cbResp10.enabled:=sbtnAlterar.caption='Alterar';
    cbResp11.enabled:=sbtnAlterar.caption='Alterar';
    cbResp12.enabled:=sbtnAlterar.caption='Alterar';
    cbResp13.enabled:=sbtnAlterar.caption='Alterar';
    cbResp14.enabled:=sbtnAlterar.caption='Alterar';
    cbResp15.enabled:=sbtnAlterar.caption='Alterar';

    pnlPergunta15.visible:=(iconvertido in [0,1,2,5,6,8]);
    pnlPergunta14.visible:=(iconvertido in [0,1,2,3,4,5,6,8]);
    pnlPergunta13.visible:=(iconvertido in [0,1]);
    pnlPergunta12.visible:=(iconvertido in [0]);
    pnlPergunta11.visible:=(iconvertido in [0,1,5,6,8]);
    pnlPergunta10.visible:=(iconvertido in [0,1,2,3,4,5,6,8]);
    pnlPergunta9.visible:=(iconvertido in [0,1]);
    pnlPergunta8.visible:=(iconvertido in [0,1,2,3,4,5,6,8]);
    pnlPergunta7.visible:=(iconvertido in [0,1,2,3,4,5,6,8]);
    pnlPergunta6.visible:=(iconvertido in [0,1,5,6,8]);
    pnlPergunta5.visible:=(iconvertido in [0,1,5,6,8]);
    pnlPergunta4a.visible:=(iconvertido in [0,1,2,5,6,8]);
    pnlPergunta4.visible:=(iconvertido in [0,1,2,5,6,8]);
    pnlPergunta3.visible:=(iconvertido in [0,1,5,6,8]);
    pnlPergunta2.visible:=(iconvertido in [0,5,6]);
    pnlPergunta1.visible:=(iconvertido in [0,5,6]);

    ConfiguraRespostaPadrao;

    tbsTmpdesc.tabvisible:=false;
    if (FlgTipoFolha in [0, 3, 4, 5, 6]) then
    begin
      self.update;
      frmAguarde.Mostra('Aguarde... Identificando lançamentos não processados.');
      qryTmpdesc.close;
      qryTmpdesc.parambyname('PMESCOBRANCA').asstring:=
        qry.FieldByName('MESREFERENCIA').asstring;
      qryTmpdesc.parambyname('PIDLOTE').asinteger:=IdLote;
      qryTmpdesc.open;
      frmAguarde.apaga;
      if not qryTmpdesc.IsEmpty then
      begin
        tbsTmpdesc.tabvisible:=true;
        MsgDlg('Existem registros na Tmpdesc não processados '+
          'pela Prévia neste lote. '+#13+
          'Favor verificar o grid com as informações para correção se necessário.',
          'Atenção', mtWarning, [mbOk], 0);
      end;
    end;
  end
  else
  begin
    pnlPergunta15.visible:=true;
    pnlPergunta14.visible:=true;
    pnlPergunta13.visible:=true;
    pnlPergunta12.visible:=true;
    pnlPergunta11.visible:=true;
    pnlPergunta10.visible:=true;
    pnlPergunta9.visible:=true;
    pnlPergunta8.visible:=true;
    pnlPergunta7.visible:=true;
    pnlPergunta6.visible:=true;
    pnlPergunta5.visible:=true;
    pnlPergunta4.visible:=true;
    pnlPergunta4a.visible:=true;
    pnlPergunta3.visible:=true;
    pnlPergunta2.visible:=true;
    pnlPergunta1.visible:=true;
  end;
end;

procedure TfrmConferenciaPrevia.SetaRespComponente(sResp: string;
  iposicao: integer; compo: TComboBox);
 var saux: string;
begin
  saux:=copy(sresp,iposicao,1);
  if saux = '' then
    compo.itemindex:=-1
  else
  begin
    if saux = '0' then
      compo.itemindex:=0
    else
    if saux = '1' then
      compo.itemindex:=1
    else
    if saux = '2' then
      compo.itemindex:=2
    else
    if saux = '3' then
      compo.itemindex:=1
    else
    if saux = '4' then
      compo.itemindex:=2
    else
    if saux = '5' then
      compo.itemindex:=3;
  end;
end;

function TfrmConferenciaPrevia.PegaRespComponente(compo: TComboBox): string;
 var pnl: tpanel;
begin
  result:='';
  pnl:=(compo.parent as tpanel);
  if not pnl.visible then
  begin
    result:='I';
    exit;
  end;
  if compo.itemindex = -1 then
    exit;
  //Não obriga
  if compo.itemindex = 0 then
    result:='0';
  if compo.tag = 1 then
  begin
    //Sim
    if compo.itemindex = 1 then
      result:='1';
    //Não
    if compo.itemindex = 2 then
      result:='2';
  end
  else
  begin
    //Completo
    if compo.itemindex = 1 then
      result:='3';
    //Por Amostragem
    if compo.itemindex = 2 then
      result:='4';
    //Sem Conferência
    if compo.itemindex = 3 then
      result:='5';
  end;
end;

procedure TfrmConferenciaPrevia.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
 var smsg, saux, sresp: string;

 function Resposta(compo: tcombobox): boolean;
 begin
   result:=false;
   saux:=PegaRespComponente(compo);
   if trim(saux) = '' then
   begin
     compo.setfocus;
     exit;
   end;
   sresp:=sresp+saux;
   result:=true;
 end;

begin
  inherited;
  try
    Accept:=false;
    sresp:='';
    smsg:='Resposta não preenchida.';
    if not Resposta(cbResp1) then
      exit;
    if not Resposta(cbResp2) then
      exit;
    if not Resposta(cbResp3) then
      exit;
    if not Resposta(cbResp4) then
      exit;
    if not Resposta(cbResp4a) then
      exit;
    if not Resposta(cbResp5) then
      exit;
    if not Resposta(cbResp6) then
      exit;
    if not Resposta(cbResp7) then
      exit;
    if not Resposta(cbResp8) then
      exit;
    if not Resposta(cbResp9) then
      exit;
    if not Resposta(cbResp10) then
      exit;
    if not Resposta(cbResp11) then
      exit;
    if not Resposta(cbResp12) then
      exit;
    if not Resposta(cbResp13) then
      exit;
    if not Resposta(cbResp14) then
      exit;
    if not Resposta(cbResp15) then
      exit;
    smsg:='';
    Accept:=true;
    qry.FieldByName('RESPCHKLIST').asstring:='1'+sresp;
    qry.FieldByName('USUCHKLIST').asstring:=Sistema.NomeUsuario;
    qry.FieldByName('DTCHKLIST').asdatetime:=now;
  finally
    if smsg <> '' then
      MsgDlg(smsg, 'Erro', mtError, [mbOk], 0);
  end;
end;

procedure TfrmConferenciaPrevia.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmConferenciaPrevia.SetDtChklist(const Value: tdatetime);
begin
  FDtChklist := Value;
end;

procedure TfrmConferenciaPrevia.SetFlgConcessao(const Value: integer);
begin
  FFlgConcessao := Value;
end;

procedure TfrmConferenciaPrevia.SetFlgTipoFolha(const Value: integer);
begin
  FFlgTipoFolha := Value;
end;

procedure TfrmConferenciaPrevia.SetFlgVoltaTmp(const Value: integer);
begin
  FFlgVoltaTmp := Value;
end;

procedure TfrmConferenciaPrevia.SetIdLote(const Value: integer);
begin
  FIdLote := Value;
end;

procedure TfrmConferenciaPrevia.SetRespChklist(const Value: string);
begin
  FRespChklist := Value;
end;

procedure TfrmConferenciaPrevia.SetUsuChklist(const Value: string);
begin
  FUsuChklist := Value;
end;

procedure TfrmConferenciaPrevia.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.enabled:=bbtnConfirmar.enabled and (FlgVoltaTmp=0);
end;

procedure TfrmConferenciaPrevia.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  LimpaPreenchimento;
  ConfiguraRespostaPadrao;
end;

procedure TfrmConferenciaPrevia.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.filtro.add('IDPESSOA = '+inttostr(iidfundacao));
end;

end.
{==============================================================================|
| UNIT: FCONFERENCIAPREVIA                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   PERMITE O PREENCHIMENTO DE UM CHECKLIST DE CONFERENCIA DA PREVIA.          |
| FUNCIONALIDADES:                                                             |
| - PREENCHE O CHECKLIST DE CONFERENCIA DA PREVIA                              |
| - CONSULTA O CHECKLIST DE CONFERENCIA DA PREVIA                              |
| - A LISTA DE PERGUNTAS VARIA COM O TIPO DE LOTE.                             |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 23/01/2003 A 23/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| PENDENCIA 11655 CONSTRUÇÃO INICIAL DA TELA.                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/06/2003 A 18/03/2003                         |
| PENDÊNCIA: 12550                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.06B                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUIR NA CONFERENCIA DA PREVIA O PROCESSO DE ATUALIZAÇÃO DE PERCENTUAL   |
| DE PENSÃO ALIMENTÍCIA.                                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/07/2003 A 04/07/2003                         |
| PENDÊNCIA: 14445                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07A                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - EM DETERMINADOS TIPOS DE FOLHA EMITIA A MENSAGEM DE RESPOSTA NÃO PREENCHIDA|
| MESMO QUE O PAINEL DA RESPOSTA ESTIVESSE INVISIVEL.                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/07/2003 A 07/07/2003                         |
| PENDÊNCIA: 14450                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.07A                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO DO MONTASELECT PARA MULTIFUNDAÇÃO.                               |
|                                                                              |
|------------------------------------------------------------------------------}

