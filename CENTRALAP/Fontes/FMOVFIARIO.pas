{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

                Analista Responsável : André C. Tavares
                        Implementado em 31/01/2002
                        Término em      01/02/2002

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
SIG         : 136510
Responsável : Luis Ferrari
Data        : 22/06/2023
Descrição   : Importação e exclusão de arquivo em lote de Popup novo layout de planilha
--------------------------------------------------------------------------------
SIG         : 125592
Responsável : Luis Ferrari
Data        : 26/04/2023
Descrição   : Importação e exclusão de arquivo em lote de Popup
--------------------------------------------------------------------------------
SIG         : 88279
Responsável : André Imakawa
Data        : 03/01/2020
Descrição   : Caso não exista grupo para o usuario que inseriu o protocolo liberar
              alteração.
--------------------------------------------------------------------------------
Padrão      : 3.02.18
Pendência   : 27752
Responsável : Daniel Simões
Data        : 11/06/2008
Descrição   : Retirada do campo 'FIARIO.DESCRICAO' do MontaSelect...
--------------------------------------------------------------------------------
Pendência   : 25827
Responsável : Daniel Simões
Data        : 16/07/2007
Descrição   : 1º.: Correção do erro na rotina 'AtualizaBotoes' onde os botões de
                   Alterar e Apagar estavam sendo habilitados de forma
                   inadequada...

              2º.: Correção do erro no Edit ou no Insert ao clicar no botão de
                   Consulta Participante ( sbtnConsultaParticip ).
--------------------------------------------------------------------------------
Pendência   : 21394
Responsável : Daniel Simões
Data        : 19/01/2007
Descrição   : Implementação do botão que chama os dados pessoais do
              participante/dependente ( Consulta Geral de Pessoa )
--------------------------------------------------------------------------------
Pendência   : 18095
Responsável : André Tavares
Data        : 12/11/2004
Descrição   :
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FMOVFIARIO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, DBCtrls, usistema, Udatabase, umenserro, dBaseDados,
  uConsPart, FProgresso, ComObj;


type
  TFRMMOVFIARIO = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Assunto: TLabel;
    dbdataInclusao: TCMDateTimePicker;
    Label3: TLabel;
    MemoAssunto: TDBMemo;
    edparticipante: TEdit;
    qryassunto: TwwQuery;
    qryassuntoDESCRICAO: TStringField;
    qryassuntoIDFIARASS: TFloatField;
    DataSource1: TDataSource;
    dblkGrupo: TwwDBLookupCombo;
    MontaSelect1: TMontaSelect;
    qryIDTITULAR: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDMODULO: TFloatField;
    qryIDRUBS: TFloatField;
    qryDATAINCLUSAO: TDateTimeField;
    qryIDGRUPO: TFloatField;
    qryIDFIARIOA: TFloatField;
    qryIDUSUARIO: TFloatField;
    qryParamCentralAp: TwwQuery;
    qryParamCentralApFLGCTRLPROTOCOLO: TFloatField;
    qryGrupoUsu: TwwQuery;
    qryGrupoUsuIDGRUPO: TFloatField;
    qryGrupoUsuIDUSUARIO: TFloatField;
    GrBXBloqueio: TGroupBox;
    SBtnLiberado: TSpeedButton;
    SBTnBloqueado: TSpeedButton;
    qryBloqueio: TwwQuery;
    qryBloqueioFLGBLOQUEIO: TFloatField;
    UpdBloqueio: TUpdateSQL;
    qryBloqueioIDPESSOA: TFloatField;
    Bevel1: TBevel;
    dbcExibeMsg: TDBCheckBox;
    cmdtpDataExpira: TCMDateTimePicker;
    Label4: TLabel;
    qryDATAEXPIRAMSG: TDateTimeField;
    qryFLGEXIBEMSG: TFloatField;
    qryGrupoUsuCorr: TwwQuery;
    qryGrupoUsuCorrIDGRUPO: TFloatField;
    qryGrupoUsuCorrIDUSUARIO: TFloatField;
    qryDESCRICAO: TMemoField;
    sbtnConsultaParticip: TSpeedButton;
    QryImpAux: TwwQuery;
    QryImportacaoArquivo: TwwQuery;
    OpenDialog1: TOpenDialog;
    QryExcluirArquivo: TwwQuery;
    QryExcluirArquivoidusuario: TFloatField;
    QryExcluirArquivonomeusuario: TStringField;
    QryExcluirArquivodescricao: TMemoField;
    DscExcluirArquivo: TwwDataSource;
    plnImporta: TPanel;
    GroupBox2: TGroupBox;
    LblImporta: TLabel;
    btnImporta: TToolbarButton97;
    Label22: TLabel;
    BBtnImporta: TSpeedButton;
    edtImporta: TEdit;
    EdtDescricaoImportacao: TEdit;
    GBExcluirImportacao: TGroupBox;
    btnExcluirArquivo: TSpeedButton;
    QryExcluirArquivodescarquivo: TStringField;
    QryExcluirArquivoidfiarioa: TFloatField;
    QryExcluirArquivodatainclusao: TStringField;
    Label5: TLabel;
    edtExclusao: TEdit;
    Btnexclusao: TToolbarButton97;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure SBtnLiberadoClick(Sender: TObject);
    procedure SBTnBloqueadoClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbcExibeMsgClick(Sender: TObject);
    procedure sbtnConsultaParticipClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImportaClick(Sender: TObject);
    procedure BBtnImportaClick(Sender: TObject);
    procedure btnExcluirArquivoClick(Sender: TObject);
    procedure BtnexclusaoClick(Sender: TObject);
  private
    function ProcessaArquivo: boolean;
    { Private declarations }

  public
    bImportExclusao : Boolean;
    { Public declarations }
  end;

var
  FRMMOVFIARIO: TFRMMOVFIARIO;
  ConsPart   : TConsPart;

implementation

uses FPrincipal, FConsPart, dConsPart, dConsPart1; // Daniel - 21394

{$R *.DFM}

procedure TFRMMOVFIARIO.CmeCadastroFind(Sender: TObject);
begin
{ Daniel - 27752 - Início ------------------------------------------------------
  Foi retirado do MontaSelect o campo-chave e a coluna 'FIARIO.DESCRICAO' que
  era o responsável pelo erro de memória que 'explodia' ao mandar buscar um
  registro sem utilizar quais quer filtros...
  Isso fez com que todos os campos-chaves abaixo do campo 'FIARIO.DESCRICAO'
  fossem reposicionados... }

{ VWPARTICIPDEPEN.MATRICSHOW    |  0
  VWPARTICIPDEPEN.IDTITULAR     |  1
  VWPARTICIPDEPEN.IDPESSOA      |  2
  VWPARTICIPDEPEN.NOME          |  3
  VWPARTICIPDEPEN.IDDEPENDENCIA |  4
  VWPARTICIPDEPEN.IDDEPENDENCIA |  5
  VWPARTICIPDEPEN.NUMDOCUMENTO  |  6
  FIARIO.IDTITULAR              |  7
  FIARIO.IDFIARIOA              |  8
  FIARIO.IDPESSOA               |  9
  FIARIO.IDUSUARIO              | 10
  FIARIO.IDMODULO               | 11
  FIARIO.IDRUBS                 | 12
  FIARIO.DATAINCLUSAO           | 13 (14)
  FIARIO.IDGRUPO                | 14 (15)
  FIARIOASSUNTO.DESCRICAO       | 15 (16)
  FIARIO.IDFIARIOA              | 16 (17) }

  inherited;

  if (MontaSelect.RetornouValor) then begin
    edParticipante.Text := MontaSelect.ValoresChave[3];
    dbDataInclusao.Text := MontaSelect.ValoresChave[13]; //14

    qryAssunto.Locate('IDFIARASS',StrToFloat(MontaSelect.ValoresChave[14]),[loCaseInsensitive,loPartialKey]); //15
    dblkGrupo.Text := MontaSelect.ValoresChave[15]; //16
    dblkGrupo.Refresh;

    qry.Close;
    qry.ParamByName('IDTITULAR').AsFloat   := StrToFloat(MontaSelect.ValoresChave[1]);
    qry.ParamByName('IDPESSOA').AsFloat    := StrToFloat(MontaSelect.ValoresChave[2]);
    qry.ParamByName('IDGRUPO').AsFloat     := StrToFloat(MontaSelect.ValoresChave[14]); //15
    qry.ParamByName('DATAINCLUSAO').AsDate := StrToDate(MontaSelect.ValoresChave[13]); //14
    qry.ParamByName('IDFIARIOA').AsFloat   := StrToFloat(MontaSelect.ValoresChave[16]); //17
    qry.Open;

    // verifica se o participante ou dependente está bloqueado
    qryBloqueio.Close;
    qryBloqueio.ParamByName('IDPESSOA').AsFloat := StrToFloat(MontaSelect.ValoresChave[2]);
    qryBloqueio.Open;

    GrBXBloqueio.Enabled := False;

    // muda o status dos botoes de bloqueio e desbloqueio
    sbtnBloqueado.Down   := qryBloqueioFLGBLOQUEIO.AsFloat=1;
    sbtnLiberado.Down    := (qryBloqueioFLGBLOQUEIO.AsFloat=0) or (qryBloqueioFLGBLOQUEIO.IsNull);
  end;
// Daniel - 27752 - Fim --------------------------------------------------------
end;

procedure TFRMMOVFIARIO.FormCreate(Sender: TObject);
begin
  inherited;

  ConsPart := TConsPart.Create(nil);
  bImportExclusao := False;
  qryParamCentralAp.open;
  QryAssunto.Open;
  qry.open;
end;

procedure TFRMMOVFIARIO.CmeCadastroConfirma(Sender: TObject);
begin
  if QRY.State = dsInsert then
  begin
    qryIdFiarioa.asFloat := leUltRegistro(nil,'Fiario');
    edparticipante.text    := MontaSelect1.ValoresChave[3];

    qryIdTitular.asFloat   := strToFloat(MontaSelect1.ValoresChave[1]);
    qryIdPessoa.asFloat    := strToFloat(MontaSelect1.ValoresChave[2]);

    qryIdGrupo.asFloat     := qryassuntoIDFIARASS.asFloat;
    qryIdUsuario.asFloat   := sistema.idusuario;
    qryIdmodulo.asFloat    := 19;
    qryIdrubs.CLEAR;
    qryDescricao.asString  :=  memoAssunto.text;
  end;

  inherited;

  //limpa a tela
  edparticipante.Text := '';
  qry.close;
  qry.ParamByName('IdTitular').asFloat := -1;
  qry.ParamByName('IdPessoa').asFloat := -1;
  qry.ParamByName('IdGrupo').asFloat  := 1;
  qry.ParamByName('DataInclusao').asDate := date;
  qry.Open;
  GrBXBloqueio.Enabled := false;
end;

procedure TFRMMOVFIARIO.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
   MontaSelect1.Executar;
   if not MontaSelect1.RetornouValor then
   begin
     bbtnCancelarClick(sender);
   end
   else
   begin
     edparticipante.text    := MontaSelect1.ValoresChave[3];
     qryDATAINCLUSAO.ASDateTime := Date;
     dbdataInclusao.text := dateTostr(date);
     if dbdataInclusao.CanFocus then dbdataInclusao.SetFocus;
     GrBXBloqueio.Enabled := true;

    // verifica se o participante ou dependente está bloqueado
    qryBloqueio.close;
    qryBloqueio.ParamByName('IdPessoa').asFloat := strToFloat(MontaSelect1.ValoresChave[2]);
    qryBloqueio.Open;
    // muda o status dos botoes de bloqueio e desbloqueio
    sbtnBloqueado.Down := qryBloqueioFLGBLOQUEIO.AsFloat = 1;
    sbtnLiberado.Down := (qryBloqueioFLGBLOQUEIO.AsFloat = 0) or (qryBloqueioFLGBLOQUEIO.isNull);


    end;

end;

procedure TFRMMOVFIARIO.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  if cmdtpDataExpira.Date = date then
  begin
     MsgDlg('Se a data de expiração for a mesma data de hoje, a mensagem não será exibida','Atenção',mtError,[mbOk],0);
     If cmdtpDataExpira.CanFocus Then cmdtpDataExpira.SetFocus;
     abort;
  end;
  if dbdataInclusao.Text = '' then
  begin
     MsgDlg('Favor informar a Data de Incluão!','Atenção',mtError,[mbOk],0);
     If dbdataInclusao.CanFocus Then dbdataInclusao.SetFocus;
     abort;
  end;
  if dblkgrupo.Text = '' then
  begin
     MsgDlg('Favor informar o Grupo de Protocolo!','Atenção',mtError,[mbOk],0);
     If dblkgrupo.CanFocus Then dblkgrupo.SetFocus;
     abort;
  end;
  if MemoAssunto.Text = '' then
  begin
     MsgDlg('A Descrição do assunto não está preenchido!','Atenção',mtError,[mbOk],0);
     If MemoAssunto.CanFocus Then MemoAssunto.SetFocus;
     abort;
  end;
  inherited;
end;

procedure TFRMMOVFIARIO.CmeCadastroAtualizaBotoes(Sender: TObject);
var iGrupoUsuCorr, iGrupoUsuFiario : Integer;
    bAchou                         : Boolean;
begin
  inherited;

  iGrupoUsuCorr   := 0;
  iGrupoUsuFiario := -1;

  if (MontaSelect.RetornouValor) then begin
    if (qryParamCentralApFLGCTRLPROTOCOLO.AsInteger=1) then begin
      if (qry.State=dsEdit) then
        sbtnApagar.Enabled := False
      else
        sbtnApagar.Enabled := StrToInt(MontaSelect.ValoresChave[10]) = Sistema.IdUsuario;

      sbtnAlterar.Enabled := StrToInt(MontaSelect.ValoresChave[10]) = Sistema.IdUsuario;
    end else begin
      if (qryParamCentralApFLGCTRLPROTOCOLO.AsInteger=2) then begin
// Início - André Tavares - Pendência: 18095 - 12/11/2004 ----------------------
        // Pega o grupo do usuario corrente
        qryGrupoUsuCorr.Close;
        qryGrupoUsuCorr.ParamByName('IDUSUARIO').AsFloat := Sistema.IdUsuario;
        qryGrupoUsuCorr.Open;

        // Pega o grupo do usuario que incluiu o registro
        qryGrupoUsu.Close;
        qryGrupoUsu.ParamByName('IDUSUARIO').AsFloat := StrToFloat(MontaSelect.ValoresChave[10]);
        qryGrupoUsu.Open;

        qryGrupoUsuCorr.First;
        bAchou := False;

        while (not qryGrupoUsuCorr.EOF) and (not bAchou) do begin
          iGrupoUsuCorr := qryGrupoUsuCorrIDGRUPO.AsInteger;

          // Andre Imakawa - SIG 88279 - Inicio
          if not(qryGrupoUsu.IsEmpty) then
          begin
            if (qryGrupoUsu.Locate('IDGRUPO',iGrupoUsuCorr,[])) then begin
              bAchou          := True;
              iGrupoUsuFiario := qryGrupoUsuIDGRUPO.AsInteger;
            end else
              iGrupoUsuFiario := -1;
          end
          else
          begin
            bAchou          := True;
            iGrupoUsuFiario := iGrupoUsuCorr;
          end;
          // Andre Imakawa - SIG 88279 - Fim

          qryGrupoUsuCorr.Next;
        end;
// Fim - André Tavares - Pendência: 18095 - 12/11/2004 -------------------------
        // Habilita os botoes se for o mesmo grupo de usuarios
        if qry.State = dsEdit then
          sbtnApagar.Enabled := False
        else
          sbtnApagar.Enabled := iGrupoUsuCorr = iGrupoUsuFiario;

        sbtnAlterar.Enabled := iGrupoUsuCorr = iGrupoUsuFiario;
      end else begin
        if (qryParamCentralApFLGCTRLPROTOCOLO.AsInteger=0) or (qryParamCentralApFLGCTRLPROTOCOLO.IsNull) then begin
          if (qry.State=dsEdit) then
            sbtnApagar.Enabled := False
          else
            sbtnApagar.Enabled := True;

          sbtnAlterar.Enabled := True;
        end;
      end;
    end;
  end else begin
    if (qry.State=dsInsert) then
      sbtnApagar.Enabled := False
    else begin
// Daniel - 25827 - Início -----------------------------------------------------
      { Adicionada a condição para habilitar o botão de apagar apenas se a query
        retornar algum conteúdo... }
      if not qry.IsEmpty then
        sbtnApagar.Enabled := True;
    end;

    { Adicionada a condição para habilitar o botão de alterar apenas se a query
      retornar algum conteúdo... }
    if not qry.IsEmpty then
      sbtnAlterar.Enabled := True;
// Daniel - 25827 - Fim --------------------------------------------------------
  end;

  if (qry.State=dsInsert) then
    sbtnAlterar.Enabled := False;

end;

procedure TFRMMOVFIARIO.bbtnConfirmarClick(Sender: TObject);
begin
  updBloqueio.Query[ukModify].ParamByName('IDPESSOA').asFloat := qryBloqueioIDPESSOA.AsFloat;
  qryBloqueio.ApplyUpdates;
  inherited;
end;

procedure TFRMMOVFIARIO.bbtnCancelarClick(Sender: TObject);
begin
  if (qryBloqueio.active) and (qryBloqueio.State = dsEdit) then
    qryBloqueio.CancelUpdates;
  inherited;
end;

procedure TFRMMOVFIARIO.SBtnLiberadoClick(Sender: TObject);
begin
  inherited;
  qryBloqueio.Edit;
  qryBloqueioFLGBLOQUEIO.asFloat := 0;
end;

procedure TFRMMOVFIARIO.SBTnBloqueadoClick(Sender: TObject);
begin
  inherited;
  qryBloqueio.Edit;
  qryBloqueioFLGBLOQUEIO.asFloat := 1;
end;

procedure TFRMMOVFIARIO.sbtnInserirClick(Sender: TObject);
begin
  if  dtmBaseDados.dbBaseDados.InTransaction then
    RollbackTransacao;
  inherited;

end;

procedure TFRMMOVFIARIO.sbtnAlterarClick(Sender: TObject);
begin
  if  dtmBaseDados.dbBaseDados.InTransaction then
    RollbackTransacao;
  inherited;

end;

procedure TFRMMOVFIARIO.sbtnApagarClick(Sender: TObject);
begin
  if  dtmBaseDados.dbBaseDados.InTransaction then
    RollbackTransacao;
  inherited;

end;

procedure TFRMMOVFIARIO.dbcExibeMsgClick(Sender: TObject);
begin
  inherited;
  cmdtpDataExpira.Enabled := dbcExibeMsg.Checked;
end;

// Daniel - 21394 - Início -----------------------------------------------------
procedure TFRMMOVFIARIO.sbtnConsultaParticipClick(Sender: TObject);
var iResultado : Integer;
begin
  inherited;

  dtmConsPart  := TdtmConsPart.Create(Self);
  dtmConsPart1 := TdtmConsPart1.Create(Self);
  iResultado   := mrCancel;

  FrmConsPart                 := TFrmConsPart.Create(Self);

// Daniel - 25827 - Início -----------------------------------------------------
  { Abre o MontaSelect de acordo com o estado da query... }
  if (qry.State=dsInsert) then begin
    fConsPart.sTitular          := MontaSelect1.ValoresChave[1];
    fConsPart.sIdPessoaConsPart := MontaSelect1.ValoresChave[1];
  end else begin
    fConsPart.sTitular          := MontaSelect.ValoresChave[1];
    fConsPart.sIdPessoaConsPart := MontaSelect.ValoresChave[1];
  end;
// Daniel - 25827 - Fim --------------------------------------------------------

  FrmConsPart.bFiario         := True;
  FrmConsPart.Visible         := False;
  FrmConsPart.pgAcessoDireto  := '';
  FrmConsPart.ShowModal;
end;
// Daniel - 21394 - Fim --------------------------------------------------------

procedure TFRMMOVFIARIO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(ConsPart);

  inherited;
end;

//Inicio Implantação SIG 125592

procedure TFRMMOVFIARIO.btnImportaClick(Sender: TObject);
begin
  inherited;
   OpenDialog1.Execute;

   if OpenDialog1.FileName <> '' then
   begin
      edtImporta.ReadOnly := false;
      edtImporta.text := OpenDialog1.FileName;
      edtImporta.ReadOnly := true;
      BBtnImporta.Enabled := true;
      bImportExclusao := False;
   end;

end;

procedure TFRMMOVFIARIO.BBtnImportaClick(Sender: TObject);
begin
  inherited;
   if Trim(EdtDescricaoImportacao.text) = '' then
   begin
         MsgDlg('O campo Descrição é obrigatório!','Erro',mtError,[mbOK],0);
         EdtDescricaoImportacao.setFocus;
         Abort;
   end;

   if Length(Trim(EdtDescricaoImportacao.text)) > 30 then
   begin
         MsgDlg('O campo Descrição precisa ter no maximo 30 caracteres!','Erro',mtError,[mbOK],0);
         EdtDescricaoImportacao.setFocus;
         Abort;
   end;

   if Trim(edtImporta.text) = '' then
   begin
         MsgDlg('É obrigatório selecionar um arquivo excel para ser Importar','Erro',mtError,[mbOK],0);
         Abort;
   end;

   if (ProcessaArquivo) then
       MsgDlg('Processo realizado com sucesso!','Informação',mtInformation,[mbOk],0);

   edtImporta.text := '';
   EdtDescricaoImportacao.text := '';
   OpenDialog1.filename := '';
   QryExcluirArquivo.Close;
   QryExcluirArquivo.Open;
   BBtnImporta.Enabled := false;

end;

function TFRMMOVFIARIO.ProcessaArquivo():boolean;
var
    Excel : Variant;
    linha, numRegs, cont : integer;
    sSeq, sSeqApagar, sObs : String;
    bApagarRegistro,bIsErro : Boolean;

    sMatricula, sIdtitular, sMensagem, sIdcontribuicao, sIdplanoprev, sNumrecebimento, sFlgentrada, sDataalimentacao,
    sDatamov, sVlrreal, sIdtiporeserva, sValorindice, sIdbeneficio, sVlrcotas, sDatarecebimento, sIdeventogerador, sObservacao : String;

begin
     try
        if not bImportExclusao then
        Begin
          sObs := EdtDescricaoImportacao.Text;

          //Verificando se a descrição informada já existe...
          QryImpAux.Close;
          QryImpAux.SQL.Clear;
          QryImpAux.SQL.Add('select * from cm.fiario where trguserinclusao = ' + QuotedStr(sObs));
          QryImpAux.Open;

          if not QryImpAux.IsEmpty then
          begin
                   if MsgDlg('Já existe uma importação com esta descrição!' + #13 + 'Não é possível continuar com a importação!' , Caption, mtInformation , [mbOk], 0) = mrOk then
                   Exit;
          end;
        end;
          //Carregando o excel...
        Excel := CreateOleObject('Excel.application');
        Excel.Visible := False;
        Excel.WorkBooks.Open(ExpandUNCFileName(OpenDialog1.FileName),1);

        if (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,  1].Value)) = 'Matrícula') and
        //   (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,  2].Value)) = 'Código Titular') and   // SIG 136510
           (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[1,  2].Value)) = 'Mensagem')  then     // SIG 136510
           numRegs := 0
        else
            begin
                 if MsgDlg('Planilha não esta na formatação correta!' + #13 + 'Linha 1 Coluna A = Matrícula ' + #13 +
                           'Linha 1 Coluna B = Mensagem ', Caption, mtInformation , [mbOk], 0) = mrOk then    // SIG 136510
                 Exit;

            end;

          //pega numero total de regitros no aquivo excel

        while (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[numRegs+2, 1].Value)) <> '') do   // SIG 136510
                inc(numRegs);


          if not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;

          //processa arquivo...
        try

              bApagarRegistro := False;
              linha := 2;
              bIsErro := False; 
              while (linha <= numRegs+1 ) do
              begin

                   if frmProgresso.Cancelou then Exit;

                   //Inicializando as variaveis e tratando os dados...
                   sMatricula := '';
                   sIdTitular := '';
                   sMensagem := '';

                   //Lendo o Excel e capturando os dados...
                   sMatricula       :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  1].Value));
              //     sIdTitular       :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  2].Value));  // SIG 136510
                   sMensagem   :=  Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha,  2].Value));   // SIG 136510


                   if sMatricula        = '' then sMatricula := 'NULL';
              //     if sIdTitular   = '' then sIdTitular := 'NULL';     // SIG 136510
                   if sMensagem  = '' then sMensagem := 'NULL';

                   if not bImportExclusao then
                     begin
                       //Salvando nas tabelas...
                       QryImportacaoArquivo.Close;
                       QryImportacaoArquivo.SQL.Clear;
                       QryImportacaoArquivo.SQL.Add(' INSERT INTO FIARIO ');
                       QryImportacaoArquivo.SQL.Add(' (IDTITULAR,  IDFIARIOA, IDPESSOA, IDUSUARIO, IDMODULO, IDRUBS, DESCRICAO, DATAINCLUSAO, TRGDTINCLUSAO, TRGUSERINCLUSAO, IDGRUPO,DATAEXPIRAMSG,FLGEXIBEMSG)');
                       QryImportacaoArquivo.SQL.Add(' VALUES ( ');
                       QryImportacaoArquivo.SQL.Add('(SELECT IDTITULAR FROM DEPENTIT WHERE MATRICULA= ');  // SIG 136510
                       QryImportacaoArquivo.SQL.Add(QuotedStr(sMatricula) + '), CM.SEQFIARIO.NEXTVAL, ');   // SIG 136510
                       QryImportacaoArquivo.SQL.Add('(SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA= ');
                       QryImportacaoArquivo.SQL.Add(QuotedStr(sMatricula) + '),') ;
                       QryImportacaoArquivo.SQL.Add(IntToStr(sistema.idusuario) + ', 19	,	null,');
                       QryImportacaoArquivo.SQL.Add(QuotedStr(sMensagem) + ', TO_CHAR(TRUNC(SYSDATE),''DD/MM/YYYY''),	sysdate,');
                       QryImportacaoArquivo.SQL.Add(QuotedStr(EdtDescricaoImportacao.text) + ' , 90	,	null,	1)');
                       try
                          QryImportacaoArquivo.ExecSql;
                       Except  // SIG99737 - Inicio
                         on E: Exception do
                          begin
                           MsgDlg('Erro: '+ E.Message,'Informação',mtInformation,[mbOk],0);
                           bIsErro:= True;
                            if dtmBaseDados.dbBaseDados.InTransaction then
                             dtmBaseDados.dbBaseDados.Rollback;
                             result := false;
                          end;
                       end;
                     end;
                   if bImportExclusao then
                     begin
                     //Apagando os registros importados...
                       QryImpAux.Close;
                       QryImpAux.sql.clear;
                       QryImpAux.sql.add('delete CM.fiario ' );
                       QryImpAux.sql.add(' where idtitular = ' );
                       QryImpAux.SQL.Add('(SELECT IDTITULAR FROM DEPENTIT WHERE MATRICULA= '); // SIG 136510
                       QryImpAux.SQL.Add(QuotedStr(sMatricula) + ')') ;    // SIG 136510
                       QryImpAux.sql.add(' and idpessoa = ' );
                       QryImpAux.SQL.Add('(SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA= ');
                       QryImpAux.SQL.Add(QuotedStr(sMatricula) + ')') ;
                       QryImpAux.sql.add(' and descricao = ' + QuotedStr(sMensagem) );
                       QryImpAux.execSql;
                       try
                          QryImpAux.ExecSql;
                       Except  // SIG99737 - Inicio
                         on E: Exception do
                          begin
                           MsgDlg('Erro: '+ E.Message,'Informação',mtInformation,[mbOk],0);
                           bIsErro:= True;
                            if dtmBaseDados.dbBaseDados.InTransaction then
                             dtmBaseDados.dbBaseDados.Rollback;
                             result := false;
                          end;
                       end;
                     end;


                   inc(linha);
                   frmProgresso.AndaFormProgresso(linha);
                   frmProgresso.Refresh;

              end;
              if dtmBaseDados.dbBaseDados.InTransaction and not bIsErro then
              begin
                 dtmBaseDados.dbBaseDados.Commit;
                 result := true;
              end
              else // SIG99737 - Inicio
                begin
                 if dtmBaseDados.dbBaseDados.InTransaction then
                 begin
                  dtmBaseDados.dbBaseDados.Rollback;
                  result := false;
                 end;
                end;


        except

              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Rollback;
                 result := false;

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

procedure TFRMMOVFIARIO.btnExcluirArquivoClick(Sender: TObject);
var sTotal : string;
bIsErro : Boolean;
begin
  inherited;
   if Trim(edtExclusao.text) = '' then
   begin
         MsgDlg('É obrigatório selecionar um arquivo excel para ser Importar','Erro',mtError,[mbOK],0);
         Abort;
   end;

   if (ProcessaArquivo) then
       MsgDlg('Exclusão realizado com sucesso!','Informação',mtInformation,[mbOk],0);

   edtExclusao.text := '';
   OpenDialog1.filename := '';
   QryExcluirArquivo.Close;
   QryExcluirArquivo.Open;
   btnExcluirArquivo.Enabled := false;

end;

// FIM Implantação SIG 125592
procedure TFRMMOVFIARIO.BtnexclusaoClick(Sender: TObject);
begin
  inherited;
   OpenDialog1.Execute;

   if OpenDialog1.FileName <> '' then
   begin
      edtExclusao.ReadOnly := false;
      edtExclusao.text := OpenDialog1.FileName;
      edtExclusao.ReadOnly := true;
      btnExcluirArquivo.Enabled := true;
      bImportExclusao := True;
   end;

end;

end.
