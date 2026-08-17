{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//Atender............: WO26057
//Data da Alteração..: 12/05/2026
//Responsável........: Leandro pocebon
//Descrição..........: Inclusão no arquivo importação campo observação
--------------------------------------------------------------------------------
//Atender............: WO22828
//Data da Alteração..: 15/07/2025
//Alteração .........: edtDataFimEvento
//Responsável........: Luis Ferrari
//Descrição..........: Inclusão do campo edtDataFimEvento (DATAEVENTOCOBFIM).
--------------------------------------------------------------------------------
//Atender............: WO9932
//Data da Alteração..: 15/04/2024
//Alteração .........: sbtnApagarClick
//Responsável........: Luis Ferrari
//Descrição..........: Retira marcação de Acordo Judicial do contrato, caso o evento de acordo judicial seja excluido.
--------------------------------------------------------------------------------
//Nº SIG.............: 130466
//Data da Alteração..: 01/02/2023
//Alteração Form.....: bbtnConfirmarClick
//Responsável........: Lendro Poceobon
//Descrição..........: Testa tipo evento de cobrança 'Processo judial - QUERO-PAGAR' para colocar data e abservação obrigatorio no bloqueio de suspensão.
--------------------------------------------------------------------------------
//Nº SIG.............: 125588/ 131183
//Data da Alteração..: 21/09/2022 25/11/ 2022
//Alteração Form.....:
//Responsável........: Luis Ferrari
//Descrição..........: Ajuste e entrada de campos para evento Acordo Judicial - QUERO PAGAR. Complemento de ajuste no SIG 130877
--------------------------------------------------------------------------------
//Nº SIG.............: 126234
//Data da Alteração..: 22/06/2022
//Alteração Form.....: QryHistoricoEventoAfterScroll e QryHistoricoEventoAfterScroll
//Responsável........: Luis Ferrari
//Descrição..........: Ajustar marcação de parcelas no grid de historico de eventos.
--------------------------------------------------------------------------------
//Nº SIG.............: 114799
//Data da Alteração..: 19/04/2021
//Alteração Form.....: (dfm hints)  ProcessaArquivo
//Responsável........: Edilaine
//Descrição..........: As informações importadas estão sendo gravadas em colunas diferentes
--------------------------------------------------------------------------------
//Nº SIG.............: 100535
//Data da Alteração..: 23/07/2020
//Alteração Form.....: (dfm) wwDBGrid2, QryHistoricoEventoAfterScroll
//Responsável........: Edilaine
//Descrição..........: ajustes para performance
--------------------------------------------------------------------------------
//Nº SIG.............: 98478
//Data da Alteração..: 05/03/2020
//Responsável........: Ewerton Beltramini
//Descrição..........: Adaptações no codigo referentes a alteração do layout do
                       arquivo para a importação em lote.
--------------------------------------------------------------------------------
//Nº SIG.............: 96707
//Data da Alteração..: 06/02/2020
//Responsável........: Taffarel Sevaybriker
//Descrição..........: Sistema não carrega em tela as informações do lançamento.
--------------------------------------------------------------------------------
//Nº SIG.............: 94153
//Data da Alteração..: 28/11/2019
//Responsável........: Ewerton Beltramini
//Descrição..........: Implementação de rotina de leitura de arquivo para
                       importação de dados.
--------------------------------------------------------------------------------
//Nº SIG.............: 90633
//Data da Alteração..: 11/09/2019
//Alteração Form.....: wwDBGrid2
//Responsável........: Darivaldo Alencar
//Descrição..........: correção de performance
--------------------------------------------------------------------------------
//Nº SOL.............: 224034/17909
//Nº PPM.............: 1165556
//Data da Alteração..: 05/02/2016
//Alteração Form.....: Inclusão de envento atualizando
//Responsável........: Darivaldo Alencar
//Descrição..........: Quando o evento de cobrança possui FLGACORDOJUDICIAL
                       gerar bloqueio individual
--------------------------------------------------------------------------------
//Nº SIG.............: 18735
//Data da Alteração..: 19/04/2016
//Alteração Form.....: quotedStr na inserção e update do campo de crm, para não ocorrer erro
//Responsável........: William Moreira da Silva
//Descrição..........: Erro ao inserir um evento com o CRM em branco
--------------------------------------------------------------------------------
//Nº SOL.............: 259673/17860
//Nº PPM.............: 1132003
//Data da Alteração..: 13/11/2015
//Alteração Form.....: Inserção dos campos
//Responsável........: Darivaldo Alencar
//Descrição..........: Inserção dos campos: NUMCRM,DTAJUIZAMENTO,JURISDICAO
--------------------------------------------------------------------------------
//Nº SOL.............: 255979/17619
//Nº PPM.............: 1006237
//Data da Alteração..: 04/08/2015
//Alteração Form.....: alteração no campo Situação AR
//Responsável........: Felipe A. Santos
//Descrição..........: inserção do item 0 - Recebido no campo Situação AR
--------------------------------------------------------------------------------
//Nº SOL.............: 250990
//Nº PPM.............: 733525
//Data da Alteração..: 31/03/2015
//Alteração Form.....: Inserção de campos
//Responsável........: William Moreira
//Descrição..........: Quando os campos estavam em branco o sistema não inseria, pq os campos não eram passados ''
--------------------------------------------------------------------------------
//Nº SOL.............: 219116/16182
//Nº PPM.............: 422309
//Data da Alteração..: 08/12/2014
//Alteração Form.....: Inserção de campos
//Responsável........: William Santana                                                     
//Descrição..........: Inserção de campos
--------------------------------------------------------------------------------
Pendência   : SOL 143413 Kintana 938370
Responsável : Fanuel Junior
Data        : 05/11/2010
Descrição   : Utilizar a procedure buscaMutuario para procurar se o usuario é
o mutuario do contrato e bloquea-lo.
--------------------------------------------------------------------------------}

unit FEventoCobrancaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroPai, CmEventosCadastro, ImgList, Db, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls,mContratoEmptmo, Grids, DBGrids, wwdbdatetimepicker, DBCtrls,
  DBTables, Wwdbigrd, Wwdbgrid, Wwquery,DBaseDados,UFuncoesEmptmo,
  wwdblook, CMDBLookupCombo, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  CMDateTimePicker, FBloqConcessao, ComCtrls, ComObj, uSistema;

type
  TFrmEventoCobrancaContrato = class(TfrmCadastroPai)
    molContratoEmptmo: TmolContratoEmptmo;
    Label1: TLabel;
    Label2: TLabel;
    cboEvento: TDBLookupComboBox;
    edtDataEvento: TwwDBDateTimePicker;
    mnuObs: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dsEventos: TDataSource;
    QryEventos: TQuery;
    gridPrestacaoGerada: TwwDBGrid;
    wwDBGrid2: TwwDBGrid;
    QryPrestacoes: TwwQuery;
    dsPrestacoes: TwwDataSource;
    updPrestacoes: TUpdateSQL;
    QryHistoricoEvento: TwwQuery;
    dsHistoricoEvento: TwwDataSource;
    Qry: TwwQuery;
    QryAux: TwwQuery;
    QryContemp: TwwQuery;
    QrySusp: TwwQuery;
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Label3: TLabel;
    edtArqEventoCobranca: TEdit;
    btnProcurar: TBitBtn;
    btnLimpaPart: TBitBtn;
    Dialog: TOpenDialog;
    BtnImportar: TBitBtn;
    Label7: TLabel;
    cboEventoArquivo: TDBLookupComboBox;
    Label8: TLabel;
    edtDataEventoArquivo: TwwDBDateTimePicker;
    QryEventosArquivo: TQuery;
    dsEventosArquivo: TDataSource;
    pnacordo: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    Label10: TLabel;
    edtAssinaturaAcordo: TwwDBDateTimePicker;
    edtHomolAcordo: TwwDBDateTimePicker;
    edtFormaPagto: TEdit;
    lbl3: TLabel;
    edtCI: TEdit;
    Label9: TLabel;
    mnuGejur: TMemo;
    pneventos: TPanel;
    lblCe: TLabel;
    lblNup: TLabel;
    lbNumcrm: TLabel;
    lblCodAR: TLabel;
    lblSitAR: TLabel;
    edtCE: TEdit;
    edtNup: TEdit;
    edNumcrm: TEdit;
    edtCodAR: TEdit;
    cboSitAr: TComboBox;
    pnjudicial: TPanel;
    lblProcJud: TLabel;
    edtProcJud: TEdit;
    lbJurisdicao: TLabel;
    edJurisdicao: TEdit;
    lbDtajuizamento: TLabel;
    edDtajuizamento: TCMDateTimePicker;
    Label11: TLabel;
    edtDataFimEvento: TwwDBDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure Habilitar(bHabilita : Boolean);
    procedure InsertCobranca();
    procedure AlteraCobranca();
    procedure AbreQuerys();
    procedure QryHistoricoEventoAfterScroll(DataSet: TDataSet);
    procedure QryHistoricoEventoAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridPrestacaoGeradaCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure gridPrestacaoGeradaTopRowChanged(Sender: TObject);
    procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnLimpaPartClick(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure cboEventoClick(Sender: TObject);
  private
    function TipoEventoCobEmptmo_FLGACORDOJUDICIAL(IdTipoEventoCobEmptmo: integer):boolean;

  public
    { Public declarations }
     sOperacao : String;
     bMudaCor  : Boolean;
     wevento   : Boolean;
     function retorna_IDBENEF(cont:string):string;
    function ProcessaArquivo():boolean;


  end;

var
  FrmEventoCobrancaContrato: TFrmEventoCobrancaContrato;

implementation

uses UMensErro,FTelaAut, fprogresso;

{$R *.DFM}

procedure TFrmEventoCobrancaContrato.FormShow(Sender: TObject);
begin
  inherited;

  QryEventos.Close;
  QryEventos.Open;

  QryEventosArquivo.Close;
  QryEventosArquivo.Open; 

  sbtnInserir.Enabled := False;
  sbtnAlterar.Enabled := False;
  sbtnApagar.Enabled  := False;
  wevento := True;
  Habilitar(False);
end;

procedure TFrmEventoCobrancaContrato.sbtnInserirClick(Sender: TObject);
begin
  inherited;

  sbtnInserir.Down      := True;
  sbtnAlterar.Down      := False;
  sbtnApagar.Down       := False;
  sbtnInserir.Enabled   := True;
  sbtnAlterar.Enabled   := False;
  sbtnApagar.Enabled    := False;

  sOperacao :='I';
  bbtnConfirmar.Enabled := True;

  BtnImportar.Enabled := False;

  cboEvento.KeyValue := -1;
  mnuObs.Clear;
  edtDataEvento.Text:='';
  edtDataFimEvento.Text:='';
  //Início - William Santana - SOL 219116.16182 PPM 422309
  edtCE.Text         := '';
  edtCodAR.Text      := '';
  cboSitAr.ItemIndex := -1;
  edtNup.Text        := '';
  edtProcJud.Text    := '';
  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
  edNumcrm.Text        := '';
  edDtajuizamento.Text := '';
  edJurisdicao.Text    := '';
  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim
  //Término - William Santana - SOL 219116.16182 PPM 422309
  // Inicio SIG 125588 Ferrari
  edtAssinaturaAcordo.Text := '';
  edtHomolAcordo.Text := '';
  edtFormaPagto.Text := '';
  edtCI.Text := '';
  mnuGejur.Clear;
  // Fim 125588
  QryPrestacoes.DisableControls;
  QryPrestacoes.First;
  While not QryPrestacoes.Eof do begin
    QryPrestacoes.Edit;
    QryPrestacoes.FieldByname('FLGSELECIONA').asInteger := 0;
    QryPrestacoes.Post;
    QryPrestacoes.Next;
  end;
  QryPrestacoes.First;
  QryPrestacoes.EnableControls;

  Habilitar(true);


end;

procedure TFrmEventoCobrancaContrato.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  sbtnInserir.Down      := False;
  sbtnAlterar.Down      := True;
  sbtnApagar.Down       := False;
  sbtnInserir.Enabled   := False;
  sbtnAlterar.Enabled   := True;
  sbtnApagar.Enabled    := False;

  sOperacao :='A';
  bbtnConfirmar.Enabled := True;
  BtnImportar.Enabled := False;
  Habilitar(true);


end;

procedure TFrmEventoCobrancaContrato.bbtnConfirmarClick(Sender: TObject);
var sMSG : String;
sEvento : String;
begin
  inherited;

  sEvento := cboEvento.KeyValue;

  if UFuncoesEmptmo.bBuscaMutuario then
     begin
        MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                          'O usuário é o próprio mutuário do '+
                          'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
        Abort;
     end;

  if not dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;

  sMSG:='';
  //Início - William Santana - SOL 219116.16182 PPM 422309
 // if (trim(cboEvento.Text) = '') then sMSG := 'É necessário informar o Evento.';
  //if (edtDataEvento.text = '' ) then sMSG  := 'É necessário preencher a Data do Evento da Cobrança.';

  if (trim(cboEvento.Text) = '') then sMSG := 'É necessário informar o evento de cobrança.';
  if (edtDataEvento.text = '' ) then sMSG  := 'É obrigatório informar a data do evento de cobrança.';
//  if (edtDataFimEvento.text = '' ) then sMSG  := 'É obrigatório informar a data fim do evento de cobrança.';     // WO22828 Ferrari
  //Término - William Santana - SOL 219116.16182 PPM 422309
  if sOperacao <> 'E' then begin
    if sMSG <> '' then begin
      MsgDlg(sMSG , Caption, mtInformation , [mbOk], 0);
      exit;
    end;
  end;

  try
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT * FROM HISTEVENTOCOBEMPTMO');
    Qry.SQL.Add('WHERE IDCONTRATOEMPTMO ='+ QryPrestacoes.FieldByname('IDCONTRATOEMPTMO').asString);
    Qry.SQL.Add('AND IDTIPOEVENTOCOBEMPTMO ='+ sEvento );
    Qry.SQL.Add('AND TO_DATE(DATAEVENTOCOB,''DD/MM/RRRR'') = TO_DATE('+QuotedStr(edtDataEvento.text)+',''DD/MM/RRRR'')');
    if QryHistoricoEvento.FieldByname('IDHISTEVENTOCOBEMPTMO').asString <> '' then begin
      Qry.SQL.Add('AND IDHISTEVENTOCOBEMPTMO <> ' +QryHistoricoEvento.FieldByname('IDHISTEVENTOCOBEMPTMO').asString);
    end;
    Qry.Open;

    if not Qry.IsEmpty then begin
      MsgDlg('Já existe uma cobrança cadastrada para esse evento na data indicada.' , Caption, mtInformation , [mbOk], 0);
      Exit;
    end;

     //Darivaldo Alencar - SOL.224034/17909 inicio
     if (tipoeventocobemptmo_FLGACORDOJUDICIAL(cboEvento.KeyValue)) then
     begin
       //Leandro Pocebon - SIG130466 - 03/01/2023 - INICIO
       if (cboEvento.KeyValue = 29) then
       begin
           if (edtAssinaturaAcordo.text = '' ) then
           begin
             MsgDlg('É obrigatório informar a data da assinatura do acordo.' , Caption, mtInformation , [mbOk], 0);
             Exit;
           end;
           try
             try
               FrmBloqConcessao := TFrmBloqConcessao.Create(Self);
               FrmBloqConcessao.sContrato:= molContratoEmptmo.edtIDContrato.Text;
               FrmBloqConcessao.sDataFimBloq := DateToStr(IncMonth(edtAssinaturaAcordo.Date,60));
               FrmBloqConcessao.sObseervacao := 'Acordo judicial firmado na Política Quero Pagar';
               FrmBloqConcessao.bObrigatorio := true;
               FrmBloqConcessao.ShowModal;
             except
                on E : Exception do
                begin
                  MsgDlg(e.Message, 'Erro', mtError, [mbOk], 0);
                  raise;
                end;
             end;
           finally
              FreeAndNil(FrmBloqConcessao);
           end;

       end
       else
       begin
         if (MsgDlg('Deseja inserir um bloqueio de concessão a'+#13+' fim de evitar novações durante o período do'+#13+' acordo judicial?','Confirmação',mtConfirmation,[mbYes, mbNo], 0) = mrYes)  then
         begin
           try
             try
               FrmBloqConcessao := TFrmBloqConcessao.Create(Self);
               FrmBloqConcessao.sContrato:= molContratoEmptmo.edtIDContrato.Text;
               FrmBloqConcessao.ShowModal;
             except
                on E : Exception do
                begin
                  MsgDlg(e.Message, 'Erro', mtError, [mbOk], 0);
                  raise;
                end;
             end;
           finally
              FreeAndNil(FrmBloqConcessao);
           end;
         end;
       end;
       //Leandro Pocebon - SIG130466 - 03/01/2023 - INICIO
        QryContemp.Close;
        QryContemp.SQL.Clear;
        QryContemp.SQL.Add('UPDATE CONTRATOEMPTMO SET FLGACORDOJUDICIAL= 1 WHERE IDCONTRATOEMPTMO = '+ molContratoEmptmo.edtIDContrato.Text);
        QryContemp.ExecSQL;

     end;
     //Darivaldo Alencar - SOL.224034/17909 fim


    if (sOperacao = 'I') then begin
      InsertCobranca();
    end else if (sOperacao = 'A') then begin
      AlteraCobranca();
    end;
  except
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Rollback;
    end;
  end;

  bbtnConfirmar.Enabled := False;
  sbtnInserir.Down      := False;
  sbtnAlterar.Down      := False;
  sbtnApagar.Down       := False;
  sbtnInserir.Enabled   := True;
  sbtnAlterar.Enabled   := False;
  sbtnApagar.Enabled    := False;
  sOperacao :='';
  Habilitar(False);
  pnacordo.Visible            := True;
  pneventos.Visible           := True;

  if dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.Commit;
  end;

  AbreQuerys();
  BtnImportar.Enabled := True;

end;

procedure TFrmEventoCobrancaContrato.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := False;
  BtnImportar.Enabled := True;

  AbreQuerys();

  sOperacao :='';

  Habilitar(False);    
  pnacordo.Visible            := True;
  pneventos.Visible           := True;

end;

procedure TFrmEventoCobrancaContrato.molContratoEmptmobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  try
    molContratoEmptmo.btnBuscaContratoClick(Sender);

    sOperacao :='';

    AbreQuerys();

    sbtnInserir.Down      := False;
    sbtnAlterar.Down      := False;
    sbtnApagar.Down       := False;

    sbtnInserir.Enabled   := True;
    sbtnAlterar.Enabled   := not QryHistoricoEvento.IsEmpty;
    sbtnApagar.Enabled    := not QryHistoricoEvento.IsEmpty;
    bbtnConfirmar.Enabled := False;

    Habilitar(False);
  except
  end;

end;

procedure TFrmEventoCobrancaContrato.sbtnApagarClick(Sender: TObject);
begin
  inherited;

  sbtnInserir.Down      := False;
  sbtnAlterar.Down      := False;
  sbtnApagar.Down       := True;
  sbtnInserir.Enabled   := False;
  sbtnAlterar.Enabled   := False;
  sbtnApagar.Enabled    := True;

  if not dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;

  try
    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add('DELETE FROM EVENTOCOBXHISTMOVEMPTMO');
    QryAux.SQL.Add('WHERE IDHISTEVENTOCOBEMPTMO = '+ QryHistoricoEvento.FieldByname('IDHISTEVENTOCOBEMPTMO').asString);
    QryAux.ExecSQL;

    QryAux.Close;
    QryAux.SQL.Clear;
    QryAux.SQL.Add('DELETE FROM HISTEVENTOCOBEMPTMO');
    QryAux.SQL.Add('WHERE IDHISTEVENTOCOBEMPTMO = '+ QryHistoricoEvento.FieldByname('IDHISTEVENTOCOBEMPTMO').asString);
    QryAux.ExecSQL;
    // Inicio WO9932 - Ferrari
    if QryHistoricoEvento.FieldByname('IDTIPOEVENTOCOBEMPTMO').asString = '20' then
      begin
        QryContemp.Close;
        QryContemp.SQL.Clear;
        QryContemp.SQL.Add('UPDATE CONTRATOEMPTMO SET FLGACORDOJUDICIAL= 0 WHERE IDCONTRATOEMPTMO = '+ molContratoEmptmo.edtIDContrato.Text);
        QryContemp.ExecSQL;
      end ;

    // Fim WO9932 - Ferrari
    AbreQuerys();

  except
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Rollback;
    end;
  end;

  sOperacao :='E';
  Habilitar(true);
  bbtnConfirmar.Enabled := True;
  BtnImportar.Enabled := False;  

end;

procedure TFrmEventoCobrancaContrato.Habilitar(bHabilita: Boolean);
begin

  cboEvento.Enabled           := bHabilita;
  edtDataEvento.Enabled       := bHabilita;
  edtDataFimEvento.Enabled       := bHabilita;       // WO22828 Ferrari
  mnuObs.Enabled              := bHabilita;
  gridPrestacaoGerada.Enabled := bHabilita;

  //Início - William Santana - SOL 219116.16182 PPM 422309
  edtCE.Enabled               := bHabilita;
  edtProcJud.Enabled          := bHabilita;
  edtNup.Enabled              := bHabilita;
  edtCodAR.Enabled            := bHabilita;
  cboSitAr.Enabled            := bHabilita;
  //Término - William Santana - SOL 219116.16182 PPM 422309

  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
  edNumcrm.Enabled            := bHabilita;
  edDtajuizamento.Enabled     := bHabilita;
  edJurisdicao.Enabled        := bHabilita;
  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim
  // Inicio SIG 125588 Ferrari
  edtAssinaturaAcordo.Enabled := bHabilita;
  edtHomolAcordo.Enabled      := bHabilita;
  edtFormaPagto.Enabled       := bHabilita;
  edtCI.Enabled               := bHabilita;
  mnuGejur.Enabled            := bHabilita;
  // Fim 125588

end;

procedure TFrmEventoCobrancaContrato.QryHistoricoEventoAfterScroll(
  DataSet: TDataSet);
var
  sIdHistMov: String; //SIG90633
  sCondicao : string;  //SIG100535
  tam : integer;       //SIG100535
begin
  inherited;

  cboEvento.KeyValue  := QryHistoricoEvento.FieldByname('IDTIPOEVENTOCOBEMPTMO').AsInteger;
  edtDataEvento.Date  := QryHistoricoEvento.FieldByname('DATAEVENTOCOB').asDateTime;
  edtDataFimEvento.Date  := QryHistoricoEvento.FieldByname('DATAEVENTOCOBFIM').asDateTime;
  mnuObs.Text         := QryHistoricoEvento.FieldByname('OBSCOB').AsString;

  //Início - William Santana - SOL 219116.16182 PPM 422309
  edtCE.Text         := QryHistoricoEvento.FieldByname('CE').AsString;
  edtCodAR.Text      := QryHistoricoEvento.FieldByname('AR').AsString;

  // Felipe A. Santos - SOL 255979/17619 PPM 1006237 - início


  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
    edNumcrm.Text         := QryHistoricoEvento.FieldByname('NUMCRM').AsString;
    edDtajuizamento.Text  := QryHistoricoEvento.FieldByname('DTAJUIZAMENTO').AsString;
    edJurisdicao.Text     := QryHistoricoEvento.FieldByname('JURISDICAO').AsString;
  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio

  if (QryHistoricoEvento.FieldByname('SITAR').AsString = '') then
    cboSitAr.ItemIndex := -1
  else
    cboSitAr.ItemIndex := QryHistoricoEvento.FieldByname('SITAR').AsInteger;

  //cboSitAr.ItemIndex := QryHistoricoEvento.FieldByname('SITAR').AsInteger-1;
  // Felipe A. Santos - SOL 255979/17619 PPM 1006237 - fim

  edtNup.Text        := QryHistoricoEvento.FieldByname('NUP').AsString;
  edtProcJud.Text    := QryHistoricoEvento.FieldByname('PROCJUD').AsString;
  //Término - William Santana - SOL 219116.16182 PPM 422309

  // Inicio SIG 125588 Ferrari
  edtAssinaturaAcordo.Date := QryHistoricoEvento.FieldByname('DATAASSINATURAACORDO').asDateTime;
  edtHomolAcordo.Date := QryHistoricoEvento.FieldByname('DATAHOMOLACORDO').asDateTime;
  edtFormaPagto.Text := QryHistoricoEvento.FieldByname('FORMAPAGTO').AsString;;
  edtCI.Text := QryHistoricoEvento.FieldByname('CI').AsString;;
  mnuGejur.Text := QryHistoricoEvento.FieldByname('GEJUR').AsString;;
  // Fim 125588

  QryPrestacoes.DisableControls;

  //SIG100535 : inicio
  {//SIG90633 -Inico
  sIdHistMov:= EmptyStr;
  QryPrestacoes.First;
  while not(QryPrestacoes.Eof) do
   begin
     if (sIdHistMov = EmptyStr) then
       sIdHistMov:= QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asString
     else
       sIdHistMov:= sIdHistMov +','+ QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asString;
     QryPrestacoes.Next;
   end;  }

   tam := (pos('ORDER', UpperCase(qryPrestacoes.sql.text))-1) - pos('FROM',  UpperCase(qryPrestacoes.sql.text));
   sCondicao := copy(qryPrestacoes.sql.text, pos('FROM',  UpperCase(qryPrestacoes.sql.text)), tam);

   //if (sIdHistMov <> EmptyStr) then
   //SIG100535 : fim
     begin
       Qry.Close;
       Qry.SQL.Clear;
       Qry.SQL.Add('SELECT IDTIPOEVENTOCOBEMPTMO, IDHISTMOVEMPTMO, DATAEVENTOCOB, DATAEVENTOCOBFIM ');
       Qry.SQL.Add(' FROM EVENTOCOBXHISTMOVEMPTMO E, HISTEVENTOCOBEMPTMO H');
       //Qry.SQL.Add('WHERE IDHISTMOVEMPTMO IN ('+sIdHistMov+') ');               //SIG100535
       Qry.SQL.Add('WHERE E.IDHISTEVENTOCOBEMPTMO = H.IDHISTEVENTOCOBEMPTMO');    //SIG100535
       Qry.SQL.Add('AND   TO_DATE(H.DATAEVENTOCOB,''DD/MM/RRRR'') = TO_DATE('+QuotedStr(QryHistoricoEvento.FieldByname('DATAEVENTOCOB').asString)+',''DD/MM/RRRR'')');
       //SIG100535 : inicio
       Qry.SQL.Add('AND EXISTS (SELECT 1 ');
       Qry.SQL.Add( sCondicao + 'AND E.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO ) ');
//       Qry.parambyname('IDCONTRATOEMPTMO').asFloat := molContratoEmptmo.IDContrato;
       Qry.parambyname('IDCONTRATOEMPTMO').asString := molContratoEmptmo.edtIDContrato.Text;         //SIG 126234 Ferrari
       //SIG100535 : fim
       Qry.Open;
     end;
   //SIG90633 -Fim

  QryPrestacoes.First;
  While not QryPrestacoes.Eof do begin
    if QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asString <> '' then begin
      //SIG90633 -Inicio
      //      Qry.Close;
      //      Qry.SQL.Clear;
      //      Qry.SQL.Add('SELECT IDTIPOEVENTOCOBEMPTMO FROM EVENTOCOBXHISTMOVEMPTMO E, HISTEVENTOCOBEMPTMO H');
      //      Qry.SQL.Add('WHERE IDHISTMOVEMPTMO = '+QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asString);
      //      Qry.SQL.Add('AND   TO_DATE(H.DATAEVENTOCOB,''DD/MM/RRRR'') = TO_DATE('+QuotedStr(QryHistoricoEvento.FieldByname('DATAEVENTOCOB').asString)+',''DD/MM/RRRR'')');
      //      Qry.SQL.Add('AND   E.IDHISTEVENTOCOBEMPTMO = H.IDHISTEVENTOCOBEMPTMO');
      //      Qry.Open;

      QryPrestacoes.Edit;
      if qry.Locate('IDHISTMOVEMPTMO; DATAEVENTOCOB',
                     VarArrayOf([QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asString,
                                 QryHistoricoEvento.FieldByname('DATAEVENTOCOB').asString]),[]) then
        begin
      //SIG90633 -Fim

          QryPrestacoes.FieldByname('FLGSELECIONA').asInteger := 1;         //SIG 126234 Ferrari
          QryPrestacoes.Post;     //SIG 126234 Ferrari
        end
      else
        begin
          // SIG 126234 Inicio
          QryPrestacoes.FieldByname('FLGSELECIONA').asInteger := 0;
          QryPrestacoes.Post;
{          if (not Qry.IsEmpty)
          and (QryHistoricoEvento.fieldByname('IDTIPOEVENTOCOBEMPTMO').asInteger = qry.fieldByname('IDTIPOEVENTOCOBEMPTMO').asInteger )
          then begin
            QryPrestacoes.FieldByname('FLGSELECIONA').asInteger := 1;
          end else begin
            QryPrestacoes.FieldByname('FLGSELECIONA').asInteger := 0;
          end;
          QryPrestacoes.Post;  }
          // Fim SIG 126234 Ferrari
        end;
    end;

    QryPrestacoes.Next;
  end;
  QryPrestacoes.First;
  QryPrestacoes.EnableControls;
  gridPrestacaoGerada.Refresh;
end;

//Darivaldo Alencar - SOL.224034/17909 inicio
function tFrmEventoCobrancaContrato.TipoEventoCobEmptmo_FLGACORDOJUDICIAL(IdTipoEventoCobEmptmo: integer):boolean;
begin
  with (QryContemp) do
     begin
       Close;
       sql.Clear;
       SQL.add('SELECT FLGACORDOJUDICIAL FROM TIPOEVENTOCOBEMPTMO WHERE IDTIPOEVENTOCOBEMPTMO = :IDTIPOEVENTOCOBEMPTMO');
       ParamByName('IDTIPOEVENTOCOBEMPTMO').AsInteger:=  IdTipoEventoCobEmptmo;
       open;
     end;

  if (QryContemp.Fieldbyname('FLGACORDOJUDICIAL').AsInteger = 1) then
     result:= true
  else
     result:= false
end;

function tFrmEventoCobrancaContrato.retorna_IDBENEF(cont:string):string;
begin
   with QryContemp do
     begin
       Close;
       SQL.Clear;
       SQL.Add('SELECT IDBENEF  FROM CONTRATOEMPTMO WHERE IDCONTRATOEMPTMO ='+cont );
       open;
     end;
     result:= QryContemp.fieldbyname('IDBENEF').asstring;
end;
//Darivaldo Alencar - SOL.224034/17909 fim

procedure TFrmEventoCobrancaContrato.InsertCobranca;
var idHistEventoCobEmptmo : Integer;
    sEvento : String;
    sSitAr : String;  // Felipe A. Santos - SOL 255979/17619 PPM 1006237
begin
  idHistEventoCobEmptmo :=0;
  sEvento               :=cboEvento.KeyValue;

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Add(' SELECT SEQHISTEVENTOCOBEMPTMO.NEXTVAL AS SEQ FROM DUAL');
  Qry.open;

  idHistEventoCobEmptmo := Qry.FieldByname('SEQ').asInteger;

  // Felipe A. Santos - SOL 255979/17619 PPM 1006237 - início
  if ((cboSitAr.Text = '') or (cboSitAr.ItemIndex = -1)) then
     sSitAr := 'NULL'
  else
     sSitAr := IntToStr(cboSitAr.ItemIndex);
  // Felipe A. Santos - SOL 255979/17619 PPM 1006237 - fim

  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Add(' INSERT INTO HISTEVENTOCOBEMPTMO');
  //Início - William Santana - SOL 219116.16182 PPM 422309
  //Qry.SQL.Add(' (IDHISTEVENTOCOBEMPTMO,IDTIPOEVENTOCOBEMPTMO,IDCONTRATOEMPTMO,DATAEVENTOCOB,OBSCOB)VALUES');
  //Qry.SQL.Add(' ('+intTostr(idHistEventoCobEmptmo)+','+sEvento+','+QryPrestacoes.FieldByname('IDCONTRATOEMPTMO').asString+','+QuotedStr(edtDataEvento.text)+','+QuotedStr(mnuOBS.Text)+') ');
  Qry.SQL.Add(' (IDHISTEVENTOCOBEMPTMO,IDTIPOEVENTOCOBEMPTMO,IDCONTRATOEMPTMO,DATAEVENTOCOB,OBSCOB,CE,AR,SITAR,NUP,PROCJUD,NUMCRM,DTAJUIZAMENTO,JURISDICAO,' +
              '  DATAASSINATURAACORDO, DATAHOMOLACORDO, FORMAPAGTO, GEJUR, CI, DATAEVENTOCOBFIM)VALUES');    // SIG 125588 Ferrari     // WO22838 Ferrari
  Qry.SQL.Add(' ('+intTostr(idHistEventoCobEmptmo)+','+sEvento+','+QryPrestacoes.FieldByname('IDCONTRATOEMPTMO').asString+','+QuotedStr(edtDataEvento.text)+','+QuotedStr(mnuOBS.Text)+

              //William Moreira da Silva - SOL 250990
              //','+edtCE.text+','+edtCodAR.text+','+IntToStr(cboSitAr.ItemIndex+1)+','+edtNup.text+','+edtProcJud.text+') ');

              ','+QuotedStr(edtCE.text)+','+QuotedStr(edtCodAR.text)+','+
              {IntToStr(cboSitAr.ItemIndex+1)}sSitAr// Felipe A. Santos - SOL 255979/17619 PPM 1006237
              //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
              +','+QuotedStr(edtNup.text)+','+QuotedStr(edtProcJud.text)+','
              //William Moreira da Silva - SIG 18735
              //+edNumcrm.text +','+QuotedStr(edDtajuizamento.text)+','+QuotedStr(edJurisdicao.text)+') ');
              +QuotedStr(edNumcrm.text) +','+QuotedStr(edDtajuizamento.text)+','+QuotedStr(edJurisdicao.text)+','
              +QuotedStr(edtAssinaturaAcordo.text) +','+QuotedStr(edtHomolAcordo.text) +','+QuotedStr(edtFormaPagto.text) +','+QuotedStr(mnuGejur.text) +','+QuotedStr(edtCI.text) +','+QuotedStr(edtDataFimEvento.text)+') ');   // SIG 125588 Ferrari    // WO22838 Ferrari

              //William Moreira da Silva - SIG 18735
              //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim

              //William Moreira da Silva - SOL 250990
  //Término - William Santana - SOL 219116.16182 PPM 422309
  Qry.ExecSQL;

  QryPrestacoes.DisableControls;
  QryPrestacoes.First;
  While not QryPrestacoes.Eof do begin
    if QryPrestacoes.FieldByname('FLGSELECIONA').asInteger = 1 then begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(' INSERT INTO EVENTOCOBXHISTMOVEMPTMO');
      Qry.SQL.Add(' (IDHISTEVENTOCOBEMPTMO,IDHISTMOVEMPTMO)VALUES');
      Qry.SQL.Add(' ('+intTostr(idHistEventoCobEmptmo)+','+QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asstring+')' );
      Qry.ExecSQL;
    end;
    QryPrestacoes.Next;
  end;
  QryPrestacoes.First;
  QryPrestacoes.EnableControls;
end;





procedure TFrmEventoCobrancaContrato.QryHistoricoEventoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;

  sbtnInserir.Down      := False;
  sbtnAlterar.Down      := False;
  sbtnApagar.Down       := False;
  sbtnInserir.Enabled   := True;
  sbtnAlterar.Enabled   := not QryHistoricoEvento.IsEmpty;
  sbtnApagar.Enabled    := not QryHistoricoEvento.IsEmpty;

  if QryHistoricoEvento.isEmpty then begin
    cboEvento.KeyValue := -1;
    mnuObs.Clear;
    edtDataEvento.Text:='';
    edtDataFimEvento.Text:='';    // WO22828 Ferrari
  end;

end;

procedure TFrmEventoCobrancaContrato.AbreQuerys;
begin
  try
    QryPrestacoes.Close;
    QryPrestacoes.parambyname('IDCONTRATOEMPTMO').asFloat := molContratoEmptmo.IDContrato;
    QryPrestacoes.Open;

    QryHistoricoEvento.AfterScroll:= nil; //SIG90633

    QryHistoricoEvento.Close;
    QryHistoricoEvento.parambyname('IDCONTRATOEMPTMO').asFloat := molContratoEmptmo.IDContrato;
    QryHistoricoEvento.Open;
  finally
    QryHistoricoEvento.AfterScroll:=  QryHistoricoEventoAfterScroll; //SIG90633
    QryHistoricoEventoAfterScroll(QryHistoricoEvento); //TAES - SIG96707
  end;
end;

procedure TFrmEventoCobrancaContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  UFuncoesEmptmo.bBuscaMutuario := false;
  if dtmBaseDados.dbBaseDados.InTransaction then begin
    dtmBaseDados.dbBaseDados.Rollback;
  end;
  
end;

procedure TFrmEventoCobrancaContrato.AlteraCobranca;
var sEvento: string;
begin

  sEvento := cboEvento.KeyValue;

  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' UPDATE HISTEVENTOCOBEMPTMO SET');
  QryAux.SQL.Add(' IDTIPOEVENTOCOBEMPTMO = '+ sEvento );
  QryAux.SQL.Add(' ,OBSCOB        = '+ QuotedStr(mnuOBS.Text));
  QryAux.SQL.Add(' ,DATAEVENTOCOB = '+ QuotedStr(edtDataEvento.Text));
  QryAux.SQL.Add(' ,DATAEVENTOCOBFIM = '+ QuotedStr(edtDataFimEvento.Text));         // WO22828 Ferrari
  //Início - William Santana - SOL 219116.16182 PPM 422309
  QryAux.SQL.Add(' , CE = '+ QuotedStr(edtCE.text));
  QryAux.SQL.Add(' , AR = '+ QuotedStr(edtCodAR.text));

  //Felipe A. Santos - SOL 255979/17619 PPM 1006237 - início
  if (cboSitAr.Text = '') or (cboSitAr.ItemIndex = -1) then
    QryAux.SQL.Add(' , SITAR = NULL')
  else
    QryAux.SQL.Add(' , SITAR = '+ IntToStr(cboSitAr.ItemIndex));

  //QryAux.SQL.Add(' , SITAR = '+ IntToStr(cboSitAr.ItemIndex+1) );
  
  //Felipe A. Santos - SOL 255979/17619 PPM 1006237 - fim

  QryAux.SQL.Add(' , NUP = '+ QuotedStr(edtNup.text) );
  QryAux.SQL.Add(' , PROCJUD = '+ QuotedStr(edtProcJud.text) );
  //Término - William Santana - SOL 219116.16182 PPM 422309
  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- inicio
  //William Moreira da Silva - SIG 18735
  //QryAux.SQL.Add(', NUMCRM ='+ edNumcrm.text );
  QryAux.SQL.Add(', NUMCRM ='+ QuotedStr(edNumcrm.text) );
  //William Moreira da Silva - SIG 18735

  QryAux.SQL.Add(', DTAJUIZAMENTO ='+ QuotedStr(edDtajuizamento.text));
  QryAux.SQL.Add(', JURISDICAO ='+ QuotedStr(edJurisdicao.text));
  //Darivaldo Alencar 259673 -- SOL 259673 ppm-1132003- fim
  // Inicio SIG 125588 Ferrari
  QryAux.SQL.Add(', DATAASSINATURAACORDO ='+ QuotedStr(edtAssinaturaAcordo.text));
  QryAux.SQL.Add(', DATAHOMOLACORDO ='+ QuotedStr(edtHomolAcordo.text));
  QryAux.SQL.Add(', FORMAPAGTO ='+ QuotedStr(edtFormaPagto.text));
  QryAux.SQL.Add(', CI ='+ QuotedStr(edtCI.text));
  QryAux.SQL.Add(', GEJUR ='+ QuotedStr(mnuGejur.text));
  // Fim 125588
  QryAux.SQL.Add('WHERE IDHISTEVENTOCOBEMPTMO = '+ QryHistoricoEvento.FieldByname('IDHISTEVENTOCOBEMPTMO').asString);
  QryAux.ExecSQL;

  QryPrestacoes.DisableControls;
  QryPrestacoes.First;
  While not QryPrestacoes.Eof do begin
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT * FROM EVENTOCOBXHISTMOVEMPTMO');
    Qry.SQL.Add('WHERE IDHISTEVENTOCOBEMPTMO='+QryHistoricoEvento.FieldByname('IDHISTEVENTOCOBEMPTMO').asString );
    Qry.SQL.Add('AND IDHISTMOVEMPTMO='+ QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asString);
    Qry.Open;

    if (QryPrestacoes.FieldByname('FLGSELECIONA').asInteger = 0) and (not Qry.IsEmpty) then begin
      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add('DELETE FROM EVENTOCOBXHISTMOVEMPTMO');
      QryAux.SQL.Add('WHERE IDHISTEVENTOCOBEMPTMO='+QryHistoricoEvento.FieldByname('IDHISTEVENTOCOBEMPTMO').asString );
      QryAux.SQL.Add('AND IDHISTMOVEMPTMO='+ QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asString);
      QryAux.ExecSQL;
    end else if (QryPrestacoes.FieldByname('FLGSELECIONA').asInteger = 1) and (Qry.IsEmpty) then begin
      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.Add(' INSERT INTO EVENTOCOBXHISTMOVEMPTMO');
      QryAux.SQL.Add(' (IDHISTEVENTOCOBEMPTMO,IDHISTMOVEMPTMO)VALUES');
      QryAux.SQL.Add(' ('+QryHistoricoEvento.FieldByname('IDHISTEVENTOCOBEMPTMO').asString+','+QryPrestacoes.FieldByname('IDHISTMOVEMPTMO').asstring+')' );
      QryAux.ExecSQL;
    end;

    QryPrestacoes.Next;
  end;
  QryPrestacoes.First;
  QryPrestacoes.EnableControls;


end;

procedure TFrmEventoCobrancaContrato.gridPrestacaoGeradaCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;

     // faz com que as linhas do grid tenham cores alternadas
   if not gridPrestacaoGerada.DataSource.DataSet.IsEmpty then begin
     if State <> [gdSelected] then
     begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWindow;
         end;
      end;
     end
     else
     begin
        ABrush.Color := clHighLight;
        AFont.Color  := clHighLightText;
     end;
   end else begin
     ABrush.Color := clWindow;
   end;


end;

procedure TFrmEventoCobrancaContrato.gridPrestacaoGeradaTopRowChanged(
  Sender: TObject);
begin
  inherited;

 (Sender as TwwDBGrid).Invalidate;

end;

procedure TFrmEventoCobrancaContrato.molContratoEmptmobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);

end;

procedure TFrmEventoCobrancaContrato.FormCreate(Sender: TObject);
begin
  self.Height:= 740;//SIG90633
  inherited;
end;
//Ewerton Beltramini SIG 94153 - Inicio...
procedure TFrmEventoCobrancaContrato.btnProcurarClick(Sender: TObject);
begin
  inherited;
  dialog.Filter := '*.xls|*.xlsx';
  if not dialog.Execute then
    Exit
  else
      edtArqEventoCobranca.Text := ExtractFileName(Dialog.FileName);
end;
//Ewerton Beltramini SIG 94153 - Fim...
//Ewerton Beltramini SIG 94153 - Inicio...
procedure TFrmEventoCobrancaContrato.btnLimpaPartClick(Sender: TObject);
begin
  inherited;
  cboEventoArquivo.KeyValue := -1;
  edtDataEventoArquivo.text := '';
  Dialog.FileName := '';
  edtArqEventoCobranca.Clear;
end;
//Ewerton Beltramini SIG 94153 - Fim...

//Ewerton Beltramini SIG 94153 - Inicio...
procedure TFrmEventoCobrancaContrato.BtnImportarClick(Sender: TObject);
var sMSG : String;
begin
  inherited;

  sMSG := '';
  if (trim(cboEventoArquivo.Text) = '') then sMSG := 'É obrigatório informar o evento de cobrança para a correta importação do Arquivo.';
  if (edtDataEventoArquivo.text = '' )  then sMSG := 'É obrigatório informar a data do evento de cobrança para a correta importação do Arquivo.';
  if (Dialog.FileName = '' )     then sMSG := 'É obrigatório informar o Arquivo a ser importado!';

  if sMSG <> '' then begin
     MsgDlg(sMSG , Caption, mtInformation , [mbOk], 0);
     exit;
  end;

  if (ProcessaArquivo) then
      MsgDlg('Processo realizado com sucesso!','Informação',mtInformation,[mbOk],0);

  btnLimpaPartClick(Sender);

end;
//Ewerton Beltramini SIG 94153 - Fim.

//Ewerton Beltramini SIG 94153 - Inicio...
function TFrmEventoCobrancaContrato.ProcessaArquivo():boolean;
var
    Excel : Variant;
    linha, numRegs, icont: integer;
    sContrato, sParcela, sDataPrevista, sCe, sAr, sSitar, sNup, sProcjud,
    sNumcrm,sDtajuizamento, sJurisdicao, sObs, sIditememptmo13, sIditememptmo99 : string;
    iContrato, iParcela, iDtPrevista, iCe, iAr, iSitar, iNup, iProcjud,                    //edilaine SIG114799
    iNumcrm, iDtajuizamento, iJurisdicao : integer;
    iAssinaturaAcordo, iHomolAcordo, iFormaPagto, iGejur, iCI : integer;   // sig 125588 Ferrari                                        //edilaine SIG114799
    sObservacao : ansistring; //wo26057 Leandro
    iObservacao : integer; //wo26057 Leandro
    idHistEventoCobEmptmo : Integer;
    sEvento, sDataEvento, sSeq, sSeqApagar, sDataFimEvento : String;      // WO22828 Ferrari
    sAssinaturaAcordo, sHomolAcordo, sFormaPagto, sGejur, sCI : string;   // sig 125588 Ferrari
    bApagarRegistro : Boolean;
    sTituloCol : string;         //edilaine SIG114799
begin

     sEvento     := cboEventoArquivo.KeyValue;
     sDataEvento := edtDataEventoArquivo.text;

     try

           Excel := CreateOleObject('Excel.application');
           Excel.Visible := False;
           Excel.WorkBooks.Open(ExpandUNCFileName(Dialog.FileName),1);

           //edilaine SIG114799 : inicio
           iContrato      := -1;
           iParcela       := -1;
           iCe            := -1;
           iAr            := -1;
           iSitar         := -1;
           iNup           := -1;
           iProcjud       := -1;
           iNumcrm        := -1;
           iDtajuizamento := -1;
           iJurisdicao    := -1;
           iDtPrevista    := -1;
           // Inicio SIG 125588 Ferrari
           iAssinaturaAcordo := -1;
           iHomolAcordo      := -1;
           iFormaPagto       := -1;
           iCI               := -1;
           iGejur            := -1;
           // FIM sig 125588
           iObservacao       := -1; //wo26057 Leandro

           iCont     := 0;
           repeat
             inc(iCont);

             if (Trim(Excel.Cells.Item[1,iCont].Text) <> '') then
             begin
               sTituloCol := UpperCase(Trim(Excel.Cells.Item[1,iCont].Text));

               if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'IDCONTRATOEMPTMO') or
                  (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'CONTRATO') then
                  iContrato := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'PARCELA') then
                  iParcela := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'CE') then
                  iCe := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'AR') then
                  iAr := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'SITAR') then
                  iSitar := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'NUP') then
                  iNup := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'PROCJUD') then
                  iProcjud := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'NUMCRM') then
                  iNumcrm := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'DTAJUIZAMENTO') then
                  iDtajuizamento := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'JURISDICAO') then
                  iJurisdicao := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'DTPREVISTA') or
                       (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'DATAPREVISTA') then
                  iDtPrevista := iCont
               // Inicio sig 125588 Ferrari
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'DATAASSINATURAACORDO') then
                  iAssinaturaAcordo := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'DATAHOMOLACORDO') then
                  iHomolAcordo := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'FORMAPAGTO') then
                  iFormaPagto := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'CI') then
                  iCI := iCont
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'GEJUR') then
                  iGejur := iCont //;  WO26057 Leandro
               // fim SIG 125588
               else if (UpperCase(Trim(Excel.Cells.Item[1,iCont].Text)) = 'OBSERVACAO') then  //WO26057 Leandro
                  iObservacao := iCont ;                                                      //WO26057 Leandro

             end;

           until (Trim(Excel.Cells.Item[1,iCont].Text) = '') and (Trim(Excel.Cells.Item[2,iCont].Text) = '');

           if (iContrato = -1) then
              //((iContrato > 0)  and (iDtPrevista = -1) and (iParcela = -1)) then
           begin
            MsgDlg('Arquivo fora do padrão. '+char(10)+char(13)+
                   'Verifique colunas CONTRATO!.', 'Empréstimo', mtWarning, [mbOK], 0);
            Exit;
           end;
           //edilaine SIG114799 : fim


          //pega numero total de regitros no aquivo excel
          numRegs := 0;
          while (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[numRegs+2, 1].Value)) <> '') do
                inc(numRegs);

          if numRegs = 0 then
          begin
               MsgDlg('Não foram localizados contratos no arquivo selecionado!' , Caption, mtInformation , [mbOk], 0);
               Exit;
          end;

          frmProgresso.MostraFormProgresso('Processando Arquivo...', True, True, True, 0, numRegs );
          frmProgresso.btnCancelar.Visible := true;
          frmProgresso.Refresh;

          if not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;

          //processa arquivo...
          try
              bApagarRegistro := False;
              linha := 2;
              while (linha-1 <= numRegs ) do
              begin

                   if frmProgresso.Cancelou then
                   begin
                       //MsgDlg('Processo cancelado pelo usuário!','Informação',mtInformation,[mbOk],0);
                         Exit;
                   end;

                   sContrato       := '';
                   sParcela        := '';  //Ewerton Beltramini SIG98478
                   sCe             := '';
                   sAr             := '';
                   sSitar          := '';
                   sNup            := '';
                   sProcjud        := '';
                   sNumcrm         := '';
                   sDtajuizamento  := '';
                   sJurisdicao     := '';
                   sObs            := '';
                   sIditememptmo13 := '';
                   sIditememptmo99 := '';
                   sDataPrevista   := '';  //Ewerton Beltramini SIG98478
                   // Inicio SIG 125588 Ferrari
                   sAssinaturaAcordo := '';
                   sHomolAcordo      := '';
                   sFormaPagto       := '';
                   sCI               := '';
                   sGejur            := '';
                   // FIM sig 125588
                   sObservacao       := ''; //WO26057 Leandro

                   //edilaine SIG114799 : inicio
                   sContrato := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {1} iContrato].Value));
                   if iParcela > 0 then
                      sParcela       := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {2} iParcela].Value));   //Ewerton Beltramini SIG98478
                   if iCe > 0 then
                      sCe            := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {3} iCe].Value));
                   if iAr > 0 then
                      sAr            := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {4} iAr].Value));
                   if iSitar > 0 then
                      sSitar         := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {5} iSitar].Value));
                   if iNup > 0 then
                      sNup           := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {6} iNup].Value));
                   if iProcjud > 0 then
                      sProcjud       := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {7} iProcjud].Value));
                   if iNumcrm > 0 then
                      sNumcrm        := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {8} iNumcrm].Value));
                   if iDtajuizamento > 0 then
                      sDtajuizamento := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, {9} iDtajuizamento].Value));
                   if iJurisdicao > 0 then
                      sJurisdicao    := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,{10} iJurisdicao].Value));
                   if iDtPrevista > 0 then
                      sDataPrevista  := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,{11} iDtPrevista].Value)); //Ewerton Beltramini SIG98478
                   // Inicio SIG 125588 Ferrari
                   if iAssinaturaAcordo > 0 then
                      sAssinaturaAcordo    := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,{12} iAssinaturaAcordo].Value));
                   if iHomolAcordo > 0 then
                      sHomolAcordo    := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,{13} iHomolAcordo].Value));
                   if iFormaPagto > 0 then
                      sFormaPagto    := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,{14} iFormaPagto].Value));
                   if iCI > 0 then
                      sCI    := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,{15} iCI].Value));
                   if iGejur > 0 then
                      sGejur    := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,{16} iGejur].Value));
                   //fim SIG 125588
                   if iObservacao > 0 then                                                                                   //WO26057 Leandro
                      sObservacao   := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,{16} iObservacao].Value));     //WO26057 Leandro

                   sObs           := cboEventoArquivo.text;
                   //edilaine SIG114799 : fim

                   if sContrato      = '' then sContrato      := 'NULL';
                   if sParcela       = '' then sParcela       := 'NULL';         //Ewerton Beltramini SIG98478
                   if sCe            = '' then sCe            := 'NULL';
                   if sAr            = '' then sAr            := 'NULL';
                   if sSitar         = '' then sSitar         := 'NULL';
                   if sNup           = '' then sNup           := 'NULL';
                   if sProcjud       = '' then sProcjud       := 'NULL';
                   if sNumcrm        = '' then sNumcrm        := 'NULL';
                   if sDtajuizamento = '' then sDtajuizamento := 'NULL';
                   if sJurisdicao    = '' then sJurisdicao    := 'NULL';
                   if sDataPrevista  = '' then sDataPrevista  := 'NULL'; //Ewerton Beltramini SIG98478
                   if sObs           = '' then sObs           := 'NULL';
                   // Inicio SIG 125588 Ferrari
                   if sAssinaturaAcordo = '' then sAssinaturaAcordo := 'NULL';
                   if sHomolAcordo      = '' then sHomolAcordo      := 'NULL';
                   if sFormaPagto       = '' then sFormaPagto       := 'NULL';
                   if sCI               = '' then sCI               := 'NULL';
                   if sGejur            = '' then sGejur            := 'NULL';
                   // FIM sig 125588

                   if sObservacao       = '' then sObservacao       := 'NULL';//WO26057 Leandro

                   QryAux.Close;
                   QryAux.SQL.Clear;
                   QryAux.SQL.Add('SELECT * FROM HISTEVENTOCOBEMPTMO');
                   QryAux.SQL.Add('WHERE IDCONTRATOEMPTMO = ' + sContrato );
                   QryAux.SQL.Add('  AND IDTIPOEVENTOCOBEMPTMO = ' + sEvento );
                   QryAux.SQL.Add('AND TO_DATE(DATAEVENTOCOB,''DD/MM/RRRR'') = TO_DATE('+QuotedStr(sDataEvento)+',''DD/MM/RRRR'')');
                   QryAux.Open;

                   if not QryAux.IsEmpty then
                   begin
                       if (bApagarRegistro = False) then
                       begin
                           if MsgDlg('Evento já cadastrado para o contrato na data indicada!' + #13 + 'Para continuar, todos os registros encontrados durante a importação, serão apagados!' + #13 + 'Deseja continuar? ', Caption, mtInformation , [mbYes,mbNo], 0) = mrYes then
                           begin
                                 bApagarRegistro := True;
                           end
                           else
                           Exit;
                       end;

                       try
                           sSeqApagar := QryAux.FieldByName('IDHISTEVENTOCOBEMPTMO').AsString;
                           QryAux.Close;
                           QryAux.SQL.Clear;
                           QryAux.SQL.Add('DELETE FROM eventocobxhistmovemptmo');
                           QryAux.SQL.Add('WHERE  IDHISTEVENTOCOBEMPTMO = ' + sSeqApagar );
                           QryAux.SQL.Add('  AND  IDHISTMOVEMPTMO = ' + sContrato );
                           //QryAux.SQL.Add('  AND TO_DATE(TRGDTINCLUSAO,''DD/MM/RRRR'') = TO_DATE('+QuotedStr(sDataEvento)+',''DD/MM/RRRR'')');  //edilaine SIG114799
                           QryAux.ExecSql;

                           //if QryAux.RowsAffected > 0 then     //edilaine SIG114799
                           begin
                                 QryAux.Close;
                                 QryAux.SQL.Clear;
                                 QryAux.SQL.Add('DELETE FROM HISTEVENTOCOBEMPTMO');
                                 QryAux.SQL.Add('WHERE IDHISTEVENTOCOBEMPTMO = ' + sSeqApagar );
                                 QryAux.SQL.Add('  AND IDTIPOEVENTOCOBEMPTMO = ' + sEvento );
                                 QryAux.SQL.Add('  AND TO_DATE(DATAEVENTOCOB,''DD/MM/RRRR'') = TO_DATE('+QuotedStr(sDataEvento)+',''DD/MM/RRRR'')');
                                 QryAux.ExecSql;
                           end;
                       except
                           MsgDlg('Erro ao tentar realizar a exclusão do Evento: ' + sEvento + #13
                                + 'Sequencia do Historico do Evento: ' + sSeqApagar + #13
                                + 'Data do Evento: ' + sDataEvento
                                , Caption, mtInformation , [mbOk], 0);
                       end;


                   end;

                   QryAux.Close;
                   QryAux.SQL.Clear;
                   QryAux.SQL.Add('SELECT seqhisteventocobemptmo.NEXTVAL as IDHISTEVENTOCOBEMPTMO FROM DUAL');
                   QryAux.Open;

                   //Carrega a sequencia a ser utilizada....
                   sSeq :=  QryAux.FieldByName('IDHISTEVENTOCOBEMPTMO').AsString;

                   //Salvando nas tabelas...
                   Qry.Close;
                   Qry.SQL.Clear;
                   Qry.SQL.Add(' INSERT INTO HISTEVENTOCOBEMPTMO (IDHISTEVENTOCOBEMPTMO, IDTIPOEVENTOCOBEMPTMO, IDCONTRATOEMPTMO, DATAEVENTOCOB, OBSCOB, ');
                   Qry.SQL.Add(' CE, AR, SITAR, NUP, PROCJUD, NUMCRM, DTAJUIZAMENTO, JURISDICAO,' +
                               ' DATAASSINATURAACORDO, DATAHOMOLACORDO, FORMAPAGTO, GEJUR, CI, DATAEVENTOCOBFIM ) VALUES ( ');      //SIG 125588 Ferrari //WO26057 Leendro
                   Qry.SQL.Add( sSeq + ',');
                   Qry.SQL.Add( sEvento + ',');
                   Qry.SQL.Add( sContrato + ',');
                   Qry.SQL.Add('to_date(' + QuotedStr(sDataEvento) + ',' + QuotedStr('dd/mm/yyyy') +'),');
                   //Qry.SQL.Add('NULL,');                                                                                                //WO26057 Leandro
                   if (sObservacao <> 'NULL') then Qry.SQL.Add( QuotedStr(sObservacao) + ',') else Qry.SQL.Add( sObservacao + ',');       //WO26057 Leandro
                   if (sCe <> 'NULL') then Qry.SQL.Add( QuotedStr(sCe) + ',') else Qry.SQL.Add( sCe + ',');      //Ewerton Beltramini SIG98478
                   if (sAr <> 'NULL') then Qry.SQL.Add( QuotedStr(sAr) + ',') else Qry.SQL.Add( sAr + ',');      //Ewerton Beltramini SIG98478
                   Qry.SQL.Add( sSitar + ',');
                   if (sNup <> 'NULL') then Qry.SQL.Add( QuotedStr(sNup) + ',') else Qry.SQL.Add( sNup + ',');    //Ewerton Beltramini SIG98478
                   if (sProcjud <> 'NULL') then Qry.SQL.Add( QuotedStr(sProcjud) + ',') else Qry.SQL.Add( sProcjud + ','); //Ewerton Beltramini SIG98478
                   Qry.SQL.Add( sNumcrm + ',');
                   if (sDtajuizamento <> 'NULL') then Qry.SQL.Add( QuotedStr(sDtajuizamento) + ',') else Qry.SQL.Add( sDtajuizamento + ',');  //Ewerton Beltramini SIG98478
                   if (sJurisdicao <> 'NULL') then Qry.SQL.Add( QuotedStr(sJurisdicao) + ',') else Qry.SQL.Add( sJurisdicao + ',');  //Ewerton Beltramini SIG98478   sig 125588
                   // Inicio SIG 125588 Ferrari
                   if (sAssinaturaAcordo <> 'NULL') then Qry.SQL.Add( QuotedStr(sAssinaturaAcordo) + ',') else Qry.SQL.Add( sAssinaturaAcordo + ',');
                   if (sHomolAcordo <> 'NULL') then Qry.SQL.Add( QuotedStr(sHomolAcordo) + ',') else Qry.SQL.Add( sHomolAcordo + ',');
                   if (sFormaPagto <> 'NULL') then Qry.SQL.Add( QuotedStr(sFormaPagto) + ',') else Qry.SQL.Add( sFormaPagto + ',');
                   if (sGejur <> 'NULL') then Qry.SQL.Add( QuotedStr(sGejur) + ',') else Qry.SQL.Add( sGejur + ',');
                   if (sCI <> 'NULL') then Qry.SQL.Add( QuotedStr(sCI) + ',') else Qry.SQL.Add( sCI + ',');
                   //Qry.SQL.Add('to_date(' + QuotedStr(sDataFimEvento) + ',' + QuotedStr('dd/mm/yyyy') +') )');    // WO22828 Ferrari
                   if (sDataFimEvento <> '') then Qry.SQL.Add('to_date(' + QuotedStr(sDataFimEvento) + ',' + QuotedStr('dd/mm/yyyy') +') )') else Qry.SQL.Add('NULL)');    // WO22828 Ferrari //WO26057 Leandro
                   Qry.ExecSql;

                   //edilaine SIG114799 : inicio
                   if (sDataPrevista <> 'NULL') or (sParcela <> 'NULL') then
                   begin
                     QryAux.Close;
                     QryAux.SQL.Clear;
                     QryAux.SQL.Add('select iditememptmo, IDHISTMOVEMPTMO from hmeprestacao');
                     QryAux.SQL.Add('where idcontratoemptmo = ' + sContrato );
                     if (sParcela <> 'NULL') then
                         QryAux.SQL.Add('  and parcela = ' + sParcela )                     //Ewerton Beltramini SIG98478
                     else if (sParcela = 'NULL') and (sDataPrevista <> 'NULL') then
                         QryAux.SQL.Add('  and dataprevista = ' + QuotedStr(sDataPrevista));  //Ewerton Beltramini SIG98478
                     //QryAux.SQL.Add('  and dataefetiva is null ');
                     QryAux.SQL.Add('  and iditememptmo in (13,99) ');
                     QryAux.SQL.Add('order by iditememptmo');
                     QryAux.Open;

                     While not QryAux.eof do
                     begin
                           if QryAux.FieldByName('iditememptmo').AsInteger = 13 then
                           begin
                                 Qry.Close;
                                 Qry.SQL.Clear;
                                 Qry.SQL.Add('insert into eventocobxhistmovemptmo ( IDHISTEVENTOCOBEMPTMO, IDHISTMOVEMPTMO, TRGDTINCLUSAO, TRGUSERINCLUSAO ) values (');
                                 Qry.SQL.Add( sSeq + ',');
                                 Qry.SQL.Add( QryAux.FieldByName('IDHISTMOVEMPTMO').AsString + ',');
                                 Qry.SQL.Add('to_date(' + QuotedStr(FormatdateTime('dd/mm/yyyy', date)) + ',' + QuotedStr('dd/mm/yyyy') +'),');
                                 Qry.SQL.Add( IntToStr(sistema.IdUsuario) + ')' );
                                 Qry.ExecSql;
                           end
                           else if QryAux.FieldByName('iditememptmo').AsInteger = 99 then
                           begin
                                 Qry.Close;
                                 Qry.SQL.Clear;
                                 Qry.SQL.Add('insert into eventocobxhistmovemptmo ( IDHISTEVENTOCOBEMPTMO, IDHISTMOVEMPTMO, TRGDTINCLUSAO, TRGUSERINCLUSAO ) values (');
                                 Qry.SQL.Add( sSeq + ',');
                                 Qry.SQL.Add( QryAux.FieldByName('IDHISTMOVEMPTMO').AsString + ',');
                                 Qry.SQL.Add('to_date(' + QuotedStr(FormatdateTime('dd/mm/yyyy', date)) + ',' + QuotedStr('dd/mm/yyyy') +'),');
                                 Qry.SQL.Add( IntToStr(sistema.IdUsuario) + ')' );
                                 Qry.ExecSql;
                           end;
                           QryAux.next;
                     end;
                   end;   //edilaine SIG114799 : fim

                   inc(linha);
                   frmProgresso.AndaFormProgresso(linha);
                   frmProgresso.Refresh;
              end;

              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Commit;
                 result := true;

            except
            begin
                  if dtmBaseDados.dbBaseDados.InTransaction then
                     dtmBaseDados.dbBaseDados.Rollback;
                     result := false;

                  //Ewerton Beltramini SIG98478
                  MsgDlg('Erro ao Realizar a Importação!' + #13 + 'Verifique se os dados na planilha estão dispostos de forma correta segundo o Layout!' , Caption, mtInformation , [mbOk], 0);
            end

            end;

     finally
      Excel.ActiveWorkBook.Saved:= 1;
      Excel.DisplayAlerts:= 0;
      Excel.ActiveWorkBook.Close(SaveChanges:= 0);
      Excel.Workbooks.Close;
      Excel.Quit;
      Excel := Unassigned;

      frmProgresso.EscondeFormProgresso;

     end;
end;
//Ewerton Beltramini SIG 94153 - fim.


procedure TFrmEventoCobrancaContrato.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  BtnImportar.Enabled := False;
end;

procedure TFrmEventoCobrancaContrato.cboEventoClick(Sender: TObject);
begin
  inherited;
  if cboEvento.KeyValue = 29 then
    begin
      wevento := False ;
      edtCE.Enabled               := wevento;
      edtProcJud.Enabled          := True;
      edtNup.Enabled              := wevento;
      edtCodAR.Enabled            := wevento;
      cboSitAr.Enabled            := wevento;
      edNumcrm.Enabled            := wevento;
      edDtajuizamento.Enabled     := True;
      edJurisdicao.Enabled        := True;
      edtAssinaturaAcordo.Enabled := True;
      edtHomolAcordo.Enabled      := True;
      edtFormaPagto.Enabled       := True;
      edtCI.Enabled               := True;
      mnuGejur.Enabled            := True;
      pnacordo.Visible            := True;
      pneventos.Visible           := False;
    end
  else
    begin
      wevento := True;
      edtCE.Enabled               := wevento;
      edtProcJud.Enabled          := True;
      edtNup.Enabled              := wevento;
      edtCodAR.Enabled            := wevento;
      cboSitAr.Enabled            := wevento;
      edNumcrm.Enabled            := wevento;
      edDtajuizamento.Enabled     := True;
      edJurisdicao.Enabled        := True;
      edtAssinaturaAcordo.Enabled := False;
      edtHomolAcordo.Enabled      := False;
      edtFormaPagto.Enabled       := False;
      edtCI.Enabled               := False;
      mnuGejur.Enabled            := False;
      pnacordo.Visible            := False;
      pneventos.Visible           := True;

    end;

end;

end.
