{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência     : WO40260
Responsável   : Leandro Pocebon
Data          : 10/07/2026
Descrição     : Ajustar para buscar a matricula do beneficiario selecionado
---------------------------------------------------------------------------------
Pendência     : WO16818
Responsável   : Luis Ferrari
Data          : 05/12/2024
Descrição     : Ajustar para que todas as Modalidades já venham selecionadas. 
---------------------------------------------------------------------------------
Pendência     : SIG57875
Responsável   : Ewerton Beltramini
Data          : 03/03/2020
Descrição     : Implementação da importação de arquivo para realizar o bloqueio em lote. 
---------------------------------------------------------------------------------
Pendência     : SIG87322
Responsável   : Taffarel Sevaybriker
Data          : 13/06/2019
Descrição     : Erro ao atualizar registro com IDCONTRATOEMPTMO nulo
---------------------------------------------------------------------------------
Pendência     : SIG85970
Responsável   : Taffarel Sevaybriker
Data          : 19/05/2019
Descrição     : Erro ao atualizar mais de um registro na tabela suspconcessao (.dfm)
---------------------------------------------------------------------------------
Pendência     : SOL 258263 PPM 991973
Responsável   : Wylliam Leite da Silva
Data          : 27/07/2015
Descrição     : "A funcionalidade de "Bloqueio de Concessão" está atualizando na
                tabela Logtotalprev pelo Max +1 ao invés do seqlogtotalprev.nextval,
                gerando erro". Para corrigir esse problema comentamos o max + 1 e
                pegamos o nextval e comentamos tambem os "iLogtotalprev + 1".
//------------------------------------------------------------------------------
Pendência     : SOL 241924 PPM 590036
Responsável   : William Moreira da Silva
Data          : 19/05/2015
Descrição     : Ajuste para o sistema suportar o campo DESCOPERACAO da tabelas LOGTOTALPREV
                Com 2000 caracteres (.DFM)
//------------------------------------------------------------------------------
//Pendência   : SOL 210109/15462 Kintana 2053936
//Responsável : Higor Nayde Ferreira
//Data        : 03/10/2014
//Descrição   : Criar formulário para motivo de bloqueio e adequar cadastro de bloqueio
//------------------------------------------------------------------------------
//Pendência   : SOL 210109/14973 Kintana 2040336
//Responsável : MARCIO SANCHES SPINOSA SOL 210109/14973 Kintana 2040336
//Data        : 12/08/2013
//Descrição   : Retira do inner join para colocar left join
//------------------------------------------------------------------------------
//Pendência   : SOL 158097 Kintana 1276573
//Responsável : BRUNO AZEVEDO
//Data        : 20/05/2011
//Descrição   : Alterado o nome da funcionalidade para "Bloqueio de Suspensão".
//------------------------------------------------------------------------------
//Pendência   : SOL 148026 KINTANA 1031173
//Responsável : Vinicius Ferreira
//Data        : 24/03/2011
//Descrição   : Permite bloquear o mutuário por modalidade
//------------------------------------------------------------------------------
//Pendência   : SOL 155616 KINTANA 1209861
//Responsável : Fanuel Junior
//Data        : 05/04/2011
//Descrição   : Alterado o nome da aba HISTÓRICO DE SUSPENSÃO para
                HISTÓRICO DE BLOQUEIO.
//------------------------------------------------------------------------------
//Pendência   : SOL 141709 KINTANA 898809
//Responsável : BRUNO AZEVEDO
//Data        : 13/08/2010
//Descrição   : Correção ao gravar o Histórico de Alterações.
//--------------------------------------------------------------------------------
//Pendência   : SOL 132155 KINTANA 759634
//Responsável : BRUNO AZEVEDO
//Data        : 22/07/2010
//Descrição   : Criação do Histórico de Alterações. Alteração no nome da Func.
//--------------------------------------------------------------------------------
//Pendência   : SOL 132000 KINTANA 758243
//Responsável : Fernando Santana
//Data        : 07/07/2010
//Descrição   : Inserir campo FLGPRAZOINDETERMINADO.
//              Quando estiver com o valor 'S' permitir data termino nula.
//--------------------------------------------------------------------------------
//Pendência   : SOL 132845 KINTANA 769397
//Responsável : BRUNO AZEVEDO
//Data        : 24/03/2010
//Descrição   : Correção ao trazer os dados do monta select. 
//--------------------------------------------------------------------------------
//Rotina: Suspenção de Concessão
//Nº SOL: 132524
//Nº KINTANA: 764314
//Data da Alteração: 19/03/2010
//Responsável: Ádler Teodoro de Souza
//Descrição: Alteração na query principal.
//******************************************************************************
//Rotina: Suspenção de Concessão
//Nº SOL: 129966
//Nº KINTANA: 718118
//Data da Alteração: 08/03/2010
//Responsável: Ádler Teodoro de Souza
//Descrição: Alteração/Implementação de funcionalidades na tela.
//******************************************************************************
Pendência   : 27370
Responsável : Daniel Simões
Data        : 11/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FSuspensaoConcessao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCSImob, Db, CmEventosCadastro, ImgList, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, ComCtrls, wwriched,
  wwdbdatetimepicker, mParticipante, mMutuario, Mask, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, uCMTypes, CheckLst, wwdbedit, Wwdotdot, Wwdbcomb,
  wwdblook, ComObj;

type
  TfrmSuspensaoConcessao = class(TfrmCadastroCSImob)
    Label3: TLabel;
    edtMotivo: TwwDBRichEdit;
    GroupBox1: TGroupBox;
    edtDataInicio: TwwDBDateTimePicker;
    edtDataFim: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    rdgStatus: TDBRadioGroup;
    chkPrazoIndeterminado: TDBCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dbGrd: TwwDBGrid;
    TabSheet2: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    dsAlt: TwwDataSource;
    qryAlt: TwwQuery;
    Label12: TLabel;
    btnInverteMov: TBitBtn;
    btnMarcaTodosMov: TBitBtn;
    qryItens: TwwQuery;
    // qrysalvamod: TwwQuery; //Vinicius Ferreira SOL 148026 KINTANA 1031173
    lstMod: TCheckListBox;
    Label5: TLabel;
    Label7: TLabel;
    qryMotivo: TwwQuery;
    qryContratoVinculado: TwwQuery;
    cbxMotivo: TwwDBLookupCombo;
    dsMotivo: TwwDataSource;
    qryMotivoIDMOTIVOSUSPCONCESSAO: TFloatField;
    qryMotivoDESCRICAO: TStringField;
    cbxContratoVinculado: TwwDBLookupCombo;
    dsContratoVinculado: TwwDataSource;
    qryContratoVinculadoIDCONTRATOEMPTMO: TFloatField;
    qryContratoVinculadoDESCRICAO: TStringField;
    qryPeriodoBloqueio: TwwQuery;
    qryAltDESCOPERACAO: TMemoField;
    qryAltNOME: TStringField;
    qryAltDATAALT: TDateTimeField;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    edtArqEventoCobranca: TEdit;
    btnProcurar: TBitBtn;
    btnLimpaPart: TBitBtn;
    BtnImportar: TBitBtn;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    qryMotivoArquivo: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    DscMotivoArquivo: TwwDataSource;
    Dialog: TOpenDialog;
    QryAux: TwwQuery;
    CmbMotivoBloqueioArquivo: TDBLookupComboBox;
    memArquivo: TMemo;
    edtDataFinalArquivo: TDateTimePicker;
    edtDataInicialArquivo: TDateTimePicker;
    Label16: TLabel;
    Bevel1: TBevel;

    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure chkPrazoIndeterminadoClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure dbGrdCellChanged(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    function  LerIdLog :integer;
    procedure AtualizaLog();
    procedure AtualizaLogMod();
    procedure btnMarcaTodosMovClick(Sender: TObject);
    procedure btnInverteMovClick(Sender: TObject);  //BRUNO AZEVEDO SOL 132155 KINTANA 759634
    procedure PreencheMod;
    procedure LancaMod;
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CarregaCombo(iIdPessoa : integer);
    procedure edtDataInicioChange(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure BtnImportarClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure btnLimpaPartClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

   private  // Private declarations

      //BRUNO AZEVEDO SOL 132155 KINTANA 759634
      dOldDataInicial, dOldDataFinal: TDateTime;
      sOldStatus, sOldPrazoInd,sOldmotivo,sOldContrato: String;
      //BRUNO AZEVEDO SOL 132155 KINTANA 759634

      bInserir : boolean;
      procedure Sel(const iIdPessoa  : Int64;
                    const dDataIni   : TDateTime
                   );

      procedure NomeUsuario;
      function  VerificaSusp(pIdPessoa : string): boolean;

      function  VerificaPreenchimento: boolean;


   public   // Public declarations
   //Vinicius Ferreira SOL 148026 KINTANA 1031173
      vIDMod : array of Int64;
      idsucemptmo : Integer;
      strModold : String;
      strModnew : String;
      function  PegaMod: String;
      function  ProcessaArquivo():boolean;
   end;



var
  frmSuspensaoConcessao: TfrmSuspensaoConcessao;
  vIDMotivo            :integer;
  vIDContratoVinculado :integer;



implementation                   
{$R *.DFM}
uses
   USistema, UMensErro, UDatabase, DBaseDados, UModulo, uFuncoesEmptmo, dLookEmptmo,
   UVerificaPreenchimento, dMS, fprogresso;



procedure TfrmSuspensaoConcessao.Sel(const iIdPessoa  : Int64;
                                     const dDataIni   : TDateTime
                                    );
begin
   CarregaCombo(iIdPessoa);
   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDPESSOA').AsInteger     := iIdPessoa;
//      ParamByName('PDATAINICIO').AsDateTime  := dDataIni; //Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118
      Open;
   end;
end;

function TfrmSuspensaoConcessao.VerificaSusp(pIdPessoa : string): Boolean;
var
  qryAux : TwwQuery;
begin
   Result := false;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BASEDADOS';

   qryAux.Close;
   qryAux.Sql.Clear;

   qryAux.Sql.Add('SELECT IDPESSOA FROM SUSPCONCESSAO WHERE IDPESSOA = '+pIdPessoa );
   qryAux.Sql.Add('   AND FLGSTATUS <> ''C''                    ');
   qryAux.Sql.Add('   AND ((TO_DATE('+QuotedStr(edtDataInicio.Text)+', ''DD/MM/YYYY'') BETWEEN SUCDATAINICIO  ');
   qryAux.Sql.Add('                                              AND SUCDATAFINAL)  ');
   qryAux.Sql.Add('    OR (TO_DATE('+QuotedStr(edtDataFim.Text)+', ''DD/MM/YYYY'') BETWEEN SUCDATAINICIO  ');
   qryAux.Sql.Add('                                          AND SUCDATAFINAL)) ');


   qryAux.Open;

   if not qryAux.IsEmpty then
     Result := True;

end;

//Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118
procedure TfrmSuspensaoConcessao.NomeUsuario;
var
  sUserInclusao,
  sUserInclusaoAlter : string;
  iUserInclusao,
  iUserInclusaoAlter : integer;
  qryAux      : TwwQuery;
  iclm : Integer;
begin

  qryAux               := TwwQuery.Create(Application);
  qryAux.DatabaseName  := 'BASEDADOS';

  while not qry.eof do begin

    sUserInclusao := copy(qry.FieldByName('TRGUSERINCLUSAO').AsString, 3, Length(qry.FieldByName('TRGUSERINCLUSAO').AsString));
    iUserInclusao := StrToIntDef(sUserInclusao, 0);
    sUserInclusaoAlter := copy(qry.FieldByName('SUCUSERALTERACAO').AsString, 3, Length(qry.FieldByName('SUCUSERALTERACAO').AsString));
    iUserInclusaoAlter := StrToIntDef(sUserInclusaoAlter, 0);

    if iUserInclusao = 0 then
    begin
      qry.Edit;
      qry.FieldByName('NOMEUSER').AsString := qry.FieldByName('TRGUSERINCLUSAO').AsString;
      qry.Post;

    end
    else
    begin
      //USUARIO INSERÇÃO
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iUserInclusao));
      qryAux.Open;

      qry.Edit;
      qry.FieldByName('NOMEUSER').AsString := qryAux.FieldByName('NOME').AsString;
      qry.Post;

    End;

    if iUserInclusaoAlter = 0 then
    begin
      qry.Edit;
      qry.FieldByName('NOMEUSERALTER').AsString := qry.FieldByName('SUCUSERALTERACAO').AsString;
      qry.Post;
    end
    else
    begin
      //USUARIO ALTERACAO
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iUserInclusaoAlter));
      qryAux.Open;

      qry.Edit;
      qry.FieldByName('NOMEUSERALTER').AsString := qryAux.FieldByName('NOME').AsString;
      qry.Post;
    end;

    qry.next;
  end;

 //qry.First;
 //PreencheMod();
 //LancaMod();

end;
//Fim - Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118


procedure TfrmSuspensaoConcessao.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
    Screen.Cursor  := crHourGlass;

    Sel(StrToInt(MontaSelect.ValoresChave[0]),
        StrToDate(MontaSelect.ValoresChave[2])
       );

    //PreencheMod();
    NomeUsuario; //Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118
    qry.first;
    if DateToStr(qry.FieldByName('SUCDATAINICIO').AsDateTime) <> EmptyStr then
     LancaMod();


    Screen.Cursor  := crDefault;
  
  end;
end;



procedure TfrmSuspensaoConcessao.CmeCadastroConfirma(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  //BRUNO AZEVEDO SOL 141709 KINTANA 898809
  if CmeCadastro.Operacao = opInserir then begin
    qry.FieldbyName('IDSUCEMPTMO').asInteger := LeUltRegistro(nil, 'SUSPCONCESSAO');
  end;
  //BRUNO AZEVEDO SOL 141709 KINTANA 898809
  inherited;
  //qry.ApplyUpdates;
  qry.Close;
  qry.Open;
  NomeUsuario;
  bInserir :=  False;

  qry.Locate('IDSUCEMPTMO',idsucemptmo,[]);

end;



procedure TfrmSuspensaoConcessao.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  if (edtDataInicio.date > edtDataFim.date) and ( not chkPrazoIndeterminado.Checked) then begin // Fernando Santana SOL 132000 KINTANA 758243
    MsgDlg('A data início tem que ser menor que a data fim!', Caption, mtError , [mbOk], 0);
    bbtnCancelarClick(Self);
    exit;
  end;

  if dtmMS.MS_Solicitante.RetornouValor then
    if (bInserir = true) and (VerificaSusp(dtmMS.MS_Solicitante.ValoresChave[0])) then
    begin
      MsgDlg('Um bloqueio de concessão não poderá coincidir com o período de outro bloqueio já cadastrado para o mesmo participante.', Caption, mtError , [mbOk], 0);
      bbtnCancelarClick(Self);
      exit;
    end;
  Accept := VerificaPreenchimento;

end;



procedure TfrmSuspensaoConcessao.CmeCadastroInsert(Sender: TObject);
begin
  dbGrd.Enabled := False;

  dtmMS.MS_Solicitante.Executar;
    bInserir :=  True;;
  Repaint;

  if dtmMS.MS_Solicitante.RetornouValor then
  begin

    Screen.Cursor := crHourGlass;

   (* abre a query principal contendo zero registros *)
    Sel(StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]), -1);

    CmeCadastro.RepetirInsert := False;

    inherited;

    qry.FieldbyName('IDPESSOA').AsInteger := StrToInt(dtmMS.MS_Solicitante.ValoresChave[0]);
    //PreencheMod(); //Vinicius Ferreira SOL 148026 KINTANA 1031173
    //BRUNO AZEVEDO SOL 132845 KINTANA 769397
    //qry.FieldbyName('MATRICULA').AsString := dtmMS.MS_Solicitante.ValoresChave[7]; //WO40260 leandro
    qry.FieldbyName('MATRICULA').AsString := dtmMS.MS_Solicitante.ValoresChave[4];   //WO40260 leandro
    //qryMATRICULA.AsString := dtmMS.MS_Solicitante.ValoresChave[18]; //Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118
    //BRUNO AZEVEDO SOL 132845 KINTANA 769397

    qry.FieldbyName('NOME').AsString      := dtmMS.MS_Solicitante.ValoresChave[2];
    qry.FieldbyName('SUCMOTIVOSUSP').Clear;
    qry.FieldbyName('FLGSTATUS').AsString := 'A'; //Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118
    qry.FieldbyName('FLGPRAZOINDETERMINADO').AsString := 'N'; //Fernando Santana SOL 132000 KINTANA 758243
    chkPrazoIndeterminado.Checked := false;   //Fernando Santana SOL 132000 KINTANA 758243

    NomeUsuario;
    qry.First;
  end;
end;



function  TfrmSuspensaoConcessao.VerificaPreenchimento: boolean;
begin
  Result := False;
  try
    if qry.FieldbyName('IDPESSOA').isNULL then
      raise EValidacao.CreateVal('É necessário indicar o Mutuário!', edtDataInicio);
    if qry.FieldbyName('SUCDATAINICIO').isNULL then
      raise EValidacao.CreateVal('É necessário indicar a Data Inicial da Suspensão!', edtDataInicio);
  except
    on ev : EValidacao do begin
      		   if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
      			Repaint;
      if ev.Control.CanFocus then ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;



procedure TfrmSuspensaoConcessao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  frmSuspensaoConcessao.Refresh; //Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118
end;

procedure TfrmSuspensaoConcessao.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  NomeUsuario; //Ádler Teodoro de Souza - SOL 129966 - KINTANA 718118
  bInserir :=  False;
  //PreencheMod(); //Vinicius Ferreira SOL 148026 KINTANA 1031173
end;

procedure TfrmSuspensaoConcessao.chkPrazoIndeterminadoClick(Sender: TObject);
begin
  inherited;
  // Inicio SOL 132000 KINTANA 758243
  if (ds.State in [dsinsert,dsedit]) then
  begin
    if chkPrazoIndeterminado.Checked  then
    begin
       edtDataFim.Text           := '';
       edtDataFim.Enabled        := false;
       qry.FieldbyName('SUCDATAFINAL').AsVariant := null;
    end
    else
       edtDataFim.Enabled := true;
  end;
  //Fim SOL 132000 KINTANA 758243
end;

procedure TfrmSuspensaoConcessao.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if(ds.State in [dsbrowse]) then
    edtDataFim.Enabled := qry.FieldbyName('FLGPRAZOINDETERMINADO').AsString = 'N';
end;

procedure TfrmSuspensaoConcessao.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  edtDataFim.Enabled            := true;  //Fernando Santana SOL 132000 KINTANA 758243
  chkPrazoIndeterminado.Checked := false; //Fernando Santana SOL 132000 KINTANA 758243
end;

procedure TfrmSuspensaoConcessao.qryAfterScroll(DataSet: TDataSet);
var iclm : Integer;
begin
  inherited;
  if qry.FieldbyName('FLGPRAZOINDETERMINADO').AsString = 'S' then
    edtDataFim.Enabled := false
  else
    edtDataFim.Enabled := true;

  {
  if qry.State = dsBrowse then begin
    if qryIDPESSOA.AsString <> EmptyStr then
     LancaMod()
     else
     begin
        for iclm:= 0 to lstMod.Items.Count - 1 Do
        begin
         lstMod.Checked[iclm] := false;
        end;
    end;
  end;
   }
end;

//BRUNO AZEVEDO SOL 132155 KINTANA 759634
procedure TfrmSuspensaoConcessao.AtualizaLog();
var
  xQryLog: TwwQuery;
  iLogTotalPrev: Integer;
  sDescricao:String;
begin
  try

    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Início
    //iLogTotalPrev := LerIdLog;//LeUltRegistro(nil, 'LOGTOTALPREV');
    iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
    //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Fim

    sDescricao := '';

    if (dOldDataInicial <> qry.FieldbyName('SUCDATAINICIO').AsDateTime) then begin
      sDescricao := ' Período de Suspensão: Data Início:('+DateToStr(dOldDataInicial)+') - ('+DateToStr(qry.FieldbyName('SUCDATAINICIO').AsDateTime)+')';
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Início
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Fim
    end;

    sDescricao := Trim(sDescricao);

    xQryLog := TwwQuery.Create(nil);
    if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qry.FieldbyName('IDSUCEMPTMO').AsString+', '+FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat)+')');
        ExecSql;
      end;
    end;

    sDescricao := '';

    if (dOldDataFinal <> qry.FieldbyName('SUCDATAFINAL').AsDateTime) and (qry.FieldbyName('SUCDATAFINAL').AsDateTime > 0) then begin
      sDescricao := sDescricao + ' Período de Suspensão: Data Final:('+DateToStr(dOldDataFinal)+') - ('+DateToStr(qry.FieldbyName('SUCDATAFINAL').AsDateTime)+')';
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Início
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Fim
    end;

    sDescricao := Trim(sDescricao);


    if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qry.FieldbyName('IDSUCEMPTMO').AsString+', '+FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat)+')');
        ExecSql;
      end;
    end;

    sDescricao := '';

    if (sOldStatus <> qry.FieldbyName('FLGSTATUS').AsString) then begin
      sDescricao := sDescricao + ' Situação: ('+sOldStatus+') - ('+qry.FieldbyName('FLGSTATUS').AsString+')';
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Início
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Fim
    end;

    sDescricao := Trim(sDescricao);


    if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qry.FieldbyName('IDSUCEMPTMO').AsString+', '+FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat)+')');
        ExecSql;
      end;
    end;

    sDescricao := '';

    if (sOldPrazoInd <> qry.FieldbyName('FLGPRAZOINDETERMINADO').AsString) then begin
      sDescricao := sDescricao + ' Prazo Indeterminado: ('+sOldPrazoInd+') - ('+qry.FieldbyName('FLGPRAZOINDETERMINADO').AsString+')';
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Início
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Fim
    end;

    sDescricao := Trim(sDescricao);


    if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qry.FieldbyName('IDSUCEMPTMO').AsString+', '+FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat)+')');
        ExecSql;
      end;
    end;
    sDescricao := '';

    if (sOldmotivo <> qryMotivo.FieldbyName('DESCRICAO').AsString) then begin
      sDescricao := sDescricao + ' Motivo do Bloqueio: ('+sOldmotivo+') - ('+qryMotivo.FieldbyName('DESCRICAO').AsString+')';
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Início
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Fim
    end;

    sDescricao := Trim(sDescricao);


    if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qry.FieldbyName('IDSUCEMPTMO').AsString+', '+FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat)+')');
        ExecSql;
      end;
    end;

    sDescricao := '';

    if (sOldContrato <> qryContratoVinculadoDESCRICAO.AsString) then begin
      sDescricao := sDescricao + ' Número de Contrato vinculado: ('+sOldContrato+') - ('+qryContratoVinculado.FieldbyName('DESCRICAO').AsString+')';
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Início
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Fim
    end;


    sDescricao := Trim(sDescricao);


    if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qry.FieldbyName('IDSUCEMPTMO').AsString+', '+FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat)+')');
        ExecSql;
      end;
    end;

  finally
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
    FreeAndNil(xQryLog);
  end;
end;
//BRUNO AZEVEDO SOL 132155 KINTANA 759634

procedure TfrmSuspensaoConcessao.dbGrdCellChanged(Sender: TObject);
var
  iclm : Integer;
begin
  inherited;
  //BRUNO AZEVEDO SOL 132155 KINTANA 759634
  qryAlt.Close;
  qryAlt.ParamByName('IDMODULO').AsInteger    := Sistema.IdModulo;
  qryAlt.ParamByName('IDPESQUISA1').AsString := qry.FieldbyName('IDSUCEMPTMO').AsString;
  qryAlt.ParamByName('IDPESQUISA2').AsString := FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat);
  qryAlt.Open;

  dOldDataInicial := qry.FieldbyName('SUCDATAINICIO').AsDateTime;
  dOldDataFinal   := qry.FieldbyName('SUCDATAFINAL').AsDateTime;
  sOldStatus      := qry.FieldbyName('FLGSTATUS').AsString;
  sOldPrazoInd    := qry.FieldbyName('FLGPRAZOINDETERMINADO').AsString;
  sOldmotivo      := qryMotivo.FieldbyName('DESCRICAO').AsString;
  sOldContrato    := qryContratoVinculado.FieldbyName('DESCRICAO').AsString;
  //BRUNO AZEVEDO SOL 132155 KINTANA 759634

  //Vinicius Ferreira SOL 148026 KINTANA  1031173
 PreencheMod();
  if qry.FieldbyName('IDPESSOA').AsString <> EmptyStr then
   LancaMod()
   else
   begin
      for iclm:= 0 to lstMod.Items.Count - 1 Do
      begin
       lstMod.Checked[iclm] := false;          
      end;
  end;


  //Vinicius Ferreira SOL 148026 KINTANA  1031173
end;

//Vinicius Ferreira SOL 148026 KINTANA  1031173
procedure TfrmSuspensaoConcessao.AtualizaLogMod();
var
  xQryLog: TwwQuery;
  iLogTotalPrev: Integer;

  Lista: TStringList;
  Lista2: TStringList;
  i,i2,i3,i4,i5,countmod : Integer;
  sTemp: String;
  sChar: String;
  Branco: Boolean;
  sExpressao: String;
  qtmod : Integer;
  sDescricao:String;
  smod,smod2: string;
  moddel,modadd,bExcluido,bAdicionado : Boolean;
  qryselectmod   : twwquery;
begin
      sExpressao := strModold;
      Branco:= False;
      schar := ',';
      sExpressao := Trim(sExpressao) + sChar;
      Lista := TStringlist.Create;
      sTemp := '';
      i := 1;
      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);

          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;
          Inc(i);
      end;
              qryselectmod := TwwQuery.Create(Nil);
              qryselectmod.DatabaseName := 'BaseDados';
              qryselectmod.Close;
              qryselectmod.SQL.Clear;
              qryselectmod.SQL.Add(' SELECT DESCMODEMP FROM SUSPCONCESSAO');
              qryselectmod.Sql.Add(' WHERE IDSUCEMPTMO = '+ IntToStr(idsucemptmo));
              qryselectmod.Open;
              strModnew := qryselectmod.FieldByName('DESCMODEMP').asString;

      sExpressao := strModnew;
      Branco:= False;
      schar := ',';
      sExpressao := Trim(sExpressao) + sChar;
      Lista2 := TStringlist.Create;
      sTemp := '';
      i := 1;
      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);

          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista2.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;

          Inc(i);
      end;
          moddel := false;
          // Antigo x Novo = nm excluidos
          if Lista.Text <> '' then
          begin
             for i2:= 0 to Lista.Count - 1 Do
             begin
               bExcluido := True;
               for i3:= 0 to Lista2.Count - 1 Do
               begin
                  if strtoint(Lista[i2]) = strtoint(Lista2[i3]) then
                  begin
                     bExcluido := False;
                  end;
               end;
               if (bExcluido) then begin
                 if sMod <> '' then begin
                   sMod := sMod + ', ';
                 end;
                 sMod := sMod + Lista[i2];
                 moddel := true;
               end;
             end;
          end;

          modadd := false;
          // Novo x Antigo = nm adicionados
          if Lista2.Text <> ''  then
          begin
             for i2:= 0 to Lista2.Count - 1 Do
             begin
               bAdicionado := True;
               for i3:= 0 to Lista.Count - 1 Do
               begin
                  if strtoint(Lista2[i2]) = strtoint(Lista[i3]) then
                  begin
                     bAdicionado := False;
                  end;
               end;
               if (bAdicionado) then begin
                 if sMod2 <> '' then
                 begin
                   sMod2 := sMod2 + ', ';
                 end;
                 sMod2 := sMod2 + Lista2[i2];
                 modadd := true;
               end;
             end;
          end;

    if (modadd) then begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
       dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Início
      //iLogTotalPrev := LerIdLog;//LeUltRegistro(nil, 'LOGTOTALPREV');
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      //Wylliam Leite da Silva - SOL:258263 PPM:991973 - Fim

      sDescricao := '';
      sDescricao := sDescricao + ' Modalidades Incluídas: ('+sMod2+')';
      sDescricao := Trim(sDescricao);

     xQryLog := TwwQuery.Create(nil);
     if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qry.FieldbyName('IDSUCEMPTMO').AsString+', '+FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat)+')');
        ExecSql;
      end;
     end;
    end;

    if (moddel) then begin
      if not dtmBaseDados.dbBaseDados.InTransaction then
      begin
       dtmBaseDados.dbBaseDados.StartTransaction;
      end;
      //Wylliam Leite da Silva - SOL: PPM: - Início
      //iLogTotalPrev := LerIdLog;//LeUltRegistro(nil, 'LOGTOTALPREV');
      iLogTotalPrev := LeUltRegistro(nil, 'LOGTOTALPREV');
      //Wylliam Leite da Silva - SOL: PPM: - Fim

      sDescricao := '';
      sDescricao := sDescricao + ' Modalidades Excluídas: ('+sMod+')';
      sDescricao := Trim(sDescricao);

     xQryLog := TwwQuery.Create(nil);
     if (sDescricao <> '') then begin
      with xQryLog do begin
        DataBaseName := 'BaseDados';
        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO LOGTOTALPREV');
        Sql.Add('(IDLOGTOTALPREV, IDMODULO, DESCOPERACAO, IDUSUARIO, DATA, IDPESQUISA1, IDPESQUISA2)');
        Sql.Add('VALUES');
        Sql.Add('('+IntToStr(iLogTotalPrev)+', '+IntToStr(Sistema.IdModulo)+', '''+sDescricao+''', '+IntToStr(Sistema.IdUsuario)+', SYSDATE, '+qry.FieldbyName('IDSUCEMPTMO').AsString+', '+FloatToStr(qry.FieldbyName('IDPESSOA').AsFloat)+')');
        ExecSql;
      end;
     end;
    end;

end;

procedure TfrmSuspensaoConcessao.bbtnConfirmarClick(Sender: TObject);
begin

   if (edtDataFim.Text = '')and(rdgStatus.ItemIndex <> 1)  and (not chkPrazoIndeterminado.checked)then begin
      MsgDlg('A data final do bloqueio não pode ser nula, exceto para bloqueios com prazo indeterminado', Caption, mtError , [mbOk], 0);
      Exit;
   end;

   if (edtDataInicio.Date >  edtDataFim.Date) and (not chkPrazoIndeterminado.checked) then begin
      MsgDlg('A data início do bloqueio não pode ser posterior a data final.', Caption, mtError , [mbOk], 0);
      edtDataInicio.ClearDateTime;
      Exit;
   end;

   if (cbxMotivo.Text = '') then begin
      MsgDlg('É obrigatório indicar o motivo do bloqueio.','Empréstimo', mtInformation, [mbOk], 0);
      exit;
   end;

   if (rdgStatus.ItemIndex = 1) and ((edtDataFim.Text = '') and (not chkPrazoIndeterminado.Checked)) then begin
       MsgDlg('É obrigatório informar a data final do bloqueio encerrado.','Empréstimo', mtInformation, [mbOk], 0);
       chkPrazoIndeterminado.Checked := false;
       exit;
   end;

   IF qry.Active
     then  idsucemptmo := qry.FieldByName('IDSUCEMPTMO').AsInteger;

   qry.DisableControls;
  //BRUNO AZEVEDO SOL 132155 KINTANA 759634
  if CmeCadastro.Operacao <> opInserir then begin  //BRUNO AZEVEDO SOL 141709 KINTANA 898809
    AtualizaLog();
    qryAlt.Close;
    qryAlt.Open;
  end;
  inherited;
    with qryitens do begin
    Close;
    Sql.Clear;
    Sql.Add('Update SUSPCONCESSAO');
    Sql.Add(' SET DESCMODEMP = '+ QuotedStr(PegaMod));
    Sql.Add(' WHERE IDPESSOA = '+ qry.FieldbyName('IDPESSOA').AsString);
    Sql.Add(' and SUCDATAINICIO = '+ QuotedStr(DatetoStr(edtDataInicio.DateTime)));
    if rdgStatus.ItemIndex = 0 then
      Sql.Add(' and FLGSTATUS = ''A''');
    if rdgStatus.ItemIndex = 1 then
      Sql.Add(' and FLGSTATUS = ''E''');
    if rdgStatus.ItemIndex = 2 then
      Sql.Add(' and FLGSTATUS = ''C''');
    ExecSQL;
    end;
  qry.EnableControls;
  if CmeCadastro.Operacao <> opInserir then begin
   AtualizaLogMod(); //Vinicius Ferreira SOL 148026 KINTANA  1031173
    qryAlt.Close;
    qryAlt.Open;
  end;
  PreencheMod();
   if DateToStr(qry.FieldByName('SUCDATAINICIO').AsDateTime) <> EmptyStr then
     LancaMod();
end;


//Vinicius Ferreira SOL 148026 KINTANA  1031173
procedure TfrmSuspensaoConcessao.btnInverteMovClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to (lstMod.Items.Count - 1) do
   lstMod.Checked[i] := not(lstMod.Checked[i]);
end;

procedure TfrmSuspensaoConcessao.btnMarcaTodosMovClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to (lstMod.Items.Count - 1) do lstMod.Checked[i] := True;
end;

procedure TfrmSuspensaoConcessao.PreencheMod;
var
   i : Integer;
begin
    dtmLookEmptmo.qryLookModEmp.Close;
   if not(dtmLookEmptmo.qryLookModEmp.Active) then begin
     //dtmLookEmptmo.qryLookModEmp.ParamByName('IDPESSOAMOD').Value := qryIDPESSOA.AsInteger;
     dtmLookEmptmo.qryLookModEmp.Open;
   end;


   // Limpa a lista
   lstMod.Items.Clear;

   // Inicializa o vetor
   i := 0;
   SetLength(vIDMod, i);

   dtmLookEmptmo.qryLookModEmp.First;
   while not(dtmLookEmptmo.qryLookModEmp.EOF) do begin

      lstMod.Items.Add(dtmLookEmptmo.qryLookModEmp.FieldByName('tcedescricao').AsString);

      inc(i);
      SetLength(vIDMod, i);
      vIDMod[i-1] := dtmLookEmptmo.qryLookModEmp.FieldByName('idtipocontremptmo').AsInteger;

      dtmLookEmptmo.qryLookModEmp.Next;
   end;
end;


function TfrmSuspensaoConcessao.PegaMod: String;
var
   i        : Integer;
   sMod  : String;
begin
   inherited;

   sMod := '';

   // concatena a String de Modalidades
   for i := 0 to (lstMod.Items.Count - 1) do
   begin
      if lstMod.Checked[i] then
      begin
         if sMod <> '' then sMod := sMod + ', ';
         sMod := sMod + IntToStr(vIDMod[i]);
      end;
   end;

   Result := sMod;
end;


procedure TfrmSuspensaoConcessao.LancaMod;
var
  strMod: String;
  Lista: TStringList;
  i,i2,i3: Integer;
  sTemp: String;
  sChar: String;
  Branco: Boolean;
  sExpressao: String;
  qtmod : Integer;
  sDescricao:string;
begin
   inherited;

      for i:= 0 to lstMod.Items.Count - 1 Do
      begin
       lstMod.Checked[i] := false;
      end;
      with qryitens do
      begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT DESCMODEMP FROM SUSPCONCESSAO');
        Sql.Add(' WHERE IDPESSOA = '+ qry.FieldbyName('IDPESSOA').AsString);
        //Sql.Add(' and SUCDATAINICIO = '+ QuotedStr(DatetoStr(edtDataInicio.DateTime)));
        Sql.Add(' and SUCDATAINICIO = '+ QuotedStr(DatetoStr(qry.FieldByName('SUCDATAINICIO').AsDateTime)));
        if rdgStatus.ItemIndex = 0 then
          Sql.Add(' and FLGSTATUS = ''A''');
        if rdgStatus.ItemIndex = 1 then
          Sql.Add(' and FLGSTATUS = ''E''');
        if rdgStatus.ItemIndex = 2 then
          Sql.Add(' and FLGSTATUS = ''C''');
        Open;
       end;

      strMod := qryItens.FieldByName('DESCMODEMP').asString;
      strModold := qryItens.FieldByName('DESCMODEMP').asString;

      Branco:= False;
      schar := ',';
      sExpressao := strMod;
      sExpressao := Trim(sExpressao) + sChar;

      Lista := TStringlist.Create;
      sTemp := '';

      i := 1;
      while i <= Length(sExpressao) do begin
        if (Copy(sExpressao, i, Length(sChar)) = sChar) then begin
          Inc(i,Length(sChar)-1);

          if ((sTemp = '') and (Branco)) or (sTemp <> '') then begin
            Lista.Add(sTemp);
          end;
          sTemp := '';
        end else begin
          sTemp := sTemp + Copy(sExpressao, i, 1);
        end;

        Inc(i);
      end;

      //qtmod := lstMod.Items.Count;
      i:= 0;
      i2:= 0;

      //andar pelos checks e verificar com a lista
      dtmLookEmptmo.qryLookModEmp.Close;
      //dtmLookEmptmo.qryLookModEmp.ParamByName('IDPESSOAMOD').Value := qryIDPESSOA.AsInteger;
      dtmLookEmptmo.qryLookModEmp.Open;


       for i:= 0 to lstMod.Items.Count - 1 Do
       begin
            sDescricao := lstMod.Items[i];
            i2         := -1;

            //Saber qual é o ID conforme descricao
            dtmLookEmptmo.qryLookModEmp.Filtered := false;
            dtmLookEmptmo.qryLookModEmp.Filter   := 'tcedescricao = ' + QuotedStr(sDescricao);
            dtmLookEmptmo.qryLookModEmp.Filtered := true;

            if dtmLookEmptmo.qryLookModEmp.RecordCount > 0 then
                    i2 := dtmLookEmptmo.qryLookModEmp.fieldbyname('idtipocontremptmo').Asinteger;

            //Verifica se tem o ID na StringList
            if i2 <> -1 then
            begin
             i3 := 0;
             for i3:= 0 to Lista.Count - 1 Do
             begin
                if i2 = strtoint(Lista[i3]) then
                begin
                    lstMod.Checked[i] := True;
                end;
             end;

            end;
       end;
       dtmLookEmptmo.qryLookModEmp.Filtered := False;

end;


procedure TfrmSuspensaoConcessao.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   dbGrd.Enabled := True;
   //qry.First; //Vinicius Ferreira SOL 148026 KINTANA 1031173
   if DateToStr(qry.FieldByName('SUCDATAINICIO').AsDateTime) <> EmptyStr then
     LancaMod();

  dOldDataInicial := qry.FieldbyName('SUCDATAINICIO').AsDateTime;
  dOldDataFinal   := qry.FieldbyName('SUCDATAFINAL').AsDateTime;
  sOldStatus      := qry.FieldbyName('FLGSTATUS').AsString;
  sOldPrazoInd    := qry.FieldbyName('FLGPRAZOINDETERMINADO').AsString;
end;


procedure TfrmSuspensaoConcessao.CarregaCombo(iIdPessoa : integer);
begin
  qryContratoVinculado.close;
  qryContratoVinculado.ParamByName('IDPESSOA').AsInteger := iIdPessoa;
  qryContratoVinculado.Prepare;
  qryContratoVinculado.open;

  qryMotivo.close;
  qryMotivo.Prepare;
  qryMotivo.Open;
end;

procedure TfrmSuspensaoConcessao.edtDataInicioChange(Sender: TObject);
begin
  inherited;
  qryPeriodoBloqueio.Close;
  qryPeriodoBloqueio.ParamByName('IDPESSOA').AsString := qry.FieldbyName('IDPESSOA').AsString;
  qryPeriodoBloqueio.ParamByName('DATAINICIO').AsString := edtDataInicio.SelText;//QuotedStr(edtDataInicio.SelText);
  qryPeriodoBloqueio.Open;

  if not qryPeriodoBloqueio.IsEmpty then begin
     MsgDlg('Um bloqueio de concessão não poderá coincidir com o período de outro bloqueio já cadastrado para o mesmo participante.', Caption, mtError , [mbOk], 0);
     edtDataInicio.Text := '';
  end;
end;

function TfrmSuspensaoConcessao.LerIdLog :integer;
var   qryLerLOG: TwwQuery;
begin
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.StartTransaction;
    end;
    qryLerLOG := TwwQuery.Create(nil);
    qryLerLOG.DataBaseName := 'BaseDados';
    qryLerLOG.Sql.Clear;
    qryLerLOG.Sql.Add('SELECT MAX(IDLOGTOTALPREV)IDLOG FROM LOGTOTALPREV ');
    qryLerLOG.open;
    result := qryLerLOG.FieldByName('IDLOG').AsInteger;
  finally
    if dtmBaseDados.dbBaseDados.InTransaction then begin
      dtmBaseDados.dbBaseDados.Commit;
    end;
    FreeAndNil(qryLerLOG);
  end;

end;

procedure TfrmSuspensaoConcessao.sbtnAlterarClick(Sender: TObject);
begin
  sOldContrato := qryContratoVinculado.FieldbyName('DESCRICAO').AsString;
  inherited;

end;

procedure TfrmSuspensaoConcessao.sbtnInserirClick(Sender: TObject);
begin
  sOldContrato := qryContratoVinculado.FieldbyName('DESCRICAO').AsString;
  inherited;
  btnMarcaTodosMovClick(Sender);    //WO16818 Ferrari

end;

//Ewerton Beltramini - SIG57875 - Inicio...
procedure TfrmSuspensaoConcessao.BtnImportarClick(Sender: TObject);
var sMSG : String;
begin
  inherited;

  sMSG := '';
  if (DateToStr(edtDataInicialArquivo.date) = '') then sMSG := 'É obrigatório informar a data Inicial do Bloqueio!';
  if (DateToStr(edtDataFinalArquivo.date) = '' ) then sMSG := 'Caso a data Final não seja informada, será considerado como Bloqueio com prazo indeterminado!';
  if (Dialog.FileName = '' )     then sMSG := 'É obrigatório informar o Arquivo a ser importado!';

  if sMSG <> '' then begin
     MsgDlg(sMSG , Caption, mtInformation , [mbOk], 0);
     exit;
  end;

  if (ProcessaArquivo) then
      MsgDlg('Processo realizado com sucesso!','Informação',mtInformation,[mbOk],0);

  btnLimpaPartClick(Sender);

end;
//Ewerton Beltramini SIG57875 - Fim.

//Ewerton Beltramini SIG57875 - Inicio...
function TfrmSuspensaoConcessao.ProcessaArquivo():boolean;
var
    Excel : Variant;
    linha, numRegs, cont: integer;
    sDataInicial, sDataFinal, sMotivoBloqueio, sMatricula, sPlano, sIdPessoa, sIdMotivoBloquieo : string;
    idHistEventoCobEmptmo : Integer;
    bApagarRegistro : Boolean;
begin


     memArquivo.Lines.Add('Lendo e importando os dados do arquivo informado...');

     sDataInicial    := '';
     sDataFinal      := '';
     sMotivoBloqueio := '';
     sDataInicial    := DateToStr(edtDataInicialArquivo.date);
     sDataFinal      := DateToStr(edtDataFinalArquivo.date);
     sMotivoBloqueio := CmbMotivoBloqueioArquivo.text;
     sIdMotivoBloquieo := CmbMotivoBloqueioArquivo.keyValue;

     if sDataInicial = '' then sDataInicial := 'NULL';
     if sDataFinal = '' then sDataFinal := 'NULL';
     if sMotivoBloqueio = '' then sMotivoBloqueio := 'NULL';

     try
           Excel := CreateOleObject('Excel.application');
           Excel.Visible := False;
           Excel.WorkBooks.Open(ExpandUNCFileName(Dialog.FileName),1);

          if not dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.StartTransaction;

          //pega numero total de regitros no aquivo excel
          numRegs := 0;
          while (Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[numRegs+1, 1].Value)) <> '') do
                inc(numRegs);

          if numRegs = 0 then
          begin
               MsgDlg('Não foram localizados os dados necessários no arquivo indicado!' , Caption, mtInformation , [mbOk], 0);
               Exit;
          end;

          frmProgresso.MostraFormProgresso('Processando Arquivo...', True, True, True, 0, numRegs );
          frmProgresso.btnCancelar.Visible := true;
          frmProgresso.Refresh;

          //processa arquivo...
          try
              bApagarRegistro := False;
              linha := 2;
              while (linha <= numRegs ) do
              begin

                   if frmProgresso.Cancelou then
                   begin
                       //MsgDlg('Processo cancelado pelo usuário!','Informação',mtInformation,[mbOk],0);
                         Exit;
                   end;

                   sMatricula      := '';
                   sPlano          := '';
                   sIdPessoa       := '';

                   sMatricula      := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 1].Value));
                   sPlano          := Trim(VarToStr(Excel.workbooks[1].sheets[1].cells[linha, 2].Value));

                   if (Length(sMatricula) < 7) and (sMatricula <> '') then
                       sMatricula := CompletaInicio(sMatricula,'0',7);

                   if sMatricula = '' then sMatricula := 'NULL';
                   if sPlano  = '' then sPlano  := 'NULL';     

                   QryAux.Close;
                   QryAux.SQL.Clear;
                   QryAux.SQL.Add('select idpessoa from depentit where matricula = ' + QuotedStr(sMatricula));
                   QryAux.Open;

                   sIdPessoa       := QryAux.FieldByName('idpessoa').AsString;
                   if sIdPessoa  = '' then sIdPessoa  := 'NULL';

                   if (sIdPessoa = '') or (sIdPessoa = 'NULL') then
                       memArquivo.Lines.Add('A Matricula : ' + QuotedStr(sMatricula) + ' Não foi localizada!');

                   QryAux.Close;
                   QryAux.SQL.Clear;
                   QryAux.SQL.Add('select * from suspconcessao ');
                   QryAux.SQL.Add('where idpessoa in (' + sIdPessoa + ')');
                   QryAux.SQL.Add('and FLGSTATUS <> ' + QuotedStr('A'));
                   QryAux.SQL.Add('and sucdatainicio = ' + QuotedStr(sDataInicial));
                   QryAux.SQL.Add('and sucdatafinal = ' + QuotedStr(sDataFinal));
                   QryAux.SQL.Add('and sucmotivosusp = ' + QuotedStr(sMotivoBloqueio));
                   QryAux.Open;

                   if not QryAux.IsEmpty then
                   begin
                       if (bApagarRegistro = False) then
                       begin
                           memArquivo.Lines.Add('Já existe bloqueio cadastrado para a Matricula na data indicada: ' + QuotedStr(sMatricula) + 'Data Incial: ' + sDataInicial + 'Data Final: ' + sDataFinal);
                           if MsgDlg('Já existe bloqueio cadastrado para a Matricula na data indicada: !' + #13
                                   + QuotedStr(sMatricula) + 'Data Incial: ' + sDataInicial + 'Data Final: ' + sDataFinal   + #13
                                   + 'Para continuar, todos os registros encontrados durante a importação, serão apagados!' + #13
                                   + 'Deseja continuar? ', Caption, mtInformation , [mbYes,mbNo], 0) = mrYes then
                           begin
                                bApagarRegistro := True;
                           end
                           else
                           Exit;
                       end;

                       QryAux.Close;
                       QryAux.SQL.Clear;
                       QryAux.SQL.Add('delete from suspconcessao');
                       QryAux.SQL.Add('where idpessoa in (select d.idpessoa from depentit d where d.matricula = ' + QuotedStr(sMatricula) + ')');
                       QryAux.SQL.Add('and FLGSTATUS <> ' + QuotedStr('A'));
                       QryAux.SQL.Add('and sucdatainicio = ' + QuotedStr(sDataInicial));
                       QryAux.SQL.Add('and sucdatafinal = ' + QuotedStr(sDataFinal));
                       QryAux.SQL.Add('and sucmotivosusp = ' + QuotedStr(sMotivoBloqueio));
                       QryAux.ExecSql;
                       memArquivo.Lines.Add('Bloqueio existente apagado! Prosseguindo com a importação...');

                   end;

                   if (sIdPessoa <> '') and (sIdPessoa <> 'NULL') then

                   begin
                         //Salvando nas tabelas...
                         QryAux.Close;
                         QryAux.SQL.Clear;
                         QryAux.SQL.Add('  INSERT INTO suspconcessao (idpessoa, ');
                         QryAux.SQL.Add('         sucdatainicio,                ');
                         QryAux.SQL.Add('         sucdatafinal,                 ');
                         QryAux.SQL.Add('         sucmotivosusp,                ');
                         QryAux.SQL.Add('         trgdtinclusao,                ');
                         QryAux.SQL.Add('         trguserinclusao,              ');
                         QryAux.SQL.Add('         flgstatus,                    ');
                         QryAux.SQL.Add('         sucuseralteracao,             ');
                         QryAux.SQL.Add('         sucdtalteracao,               ');
                         QryAux.SQL.Add('         flgprazoindeterminado,        ');
                         QryAux.SQL.Add('         idsucemptmo,                  ');
                         QryAux.SQL.Add('         IDMOTIVOSUSPCONCESSAO)        ');

                         QryAux.SQL.Add('  VALUES(' + sIdPessoa + ',');
                         QryAux.SQL.Add('         to_date(' + QuotedStr(sDataInicial) + ',' + QuotedStr('dd/mm/rrrr') + '),');
                         QryAux.SQL.Add('         to_date(' + QuotedStr(sDataFinal)   + ',' + QuotedStr('dd/mm/rrrr') + '),');
                         QryAux.SQL.Add(          QuotedStr(sMotivoBloqueio) + ',');
                         QryAux.SQL.Add('         SYSDATE,');
                         QryAux.SQL.Add('         USER,');
                         QryAux.SQL.Add(          QuotedStr('A') + ',');
                         QryAux.SQL.Add('         null,');
                         QryAux.SQL.Add('         null,');

                         if sDataFinal <> '' then
                            QryAux.SQL.Add(          QuotedStr('N') + ',')
                         else
                            QryAux.SQL.Add(          QuotedStr('S') + ',');

                         QryAux.SQL.Add('         seqsuspconcessao.nextval,');
                         QryAux.SQL.Add(sIdMotivoBloquieo + ' )');
                         QryAux.ExecSql;
                         memArquivo.Lines.Add(' --> ' + QuotedStr(sMatricula) + ' Data Incial: ' + sDataInicial + ' Data Final: ' + sDataFinal + ' Incluido; Linha:' + IntToStr(linha));
                   end;

                   inc(linha);
                   frmProgresso.AndaFormProgresso(linha);
                   frmProgresso.Refresh;

              end;

              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Commit;

                 memArquivo.Lines.Add('Arquivo Importado com Sucesso!');
                 result := true;

            except

              if dtmBaseDados.dbBaseDados.InTransaction then
                 dtmBaseDados.dbBaseDados.Rollback;

                 memArquivo.Lines.Add('Erro ao Importar o Arquivo! Importação Desfeita!');
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
//Ewerton Beltramini SIG57875 - fim.

//Ewerton Beltramini SIG57875 - Inicio.
procedure TfrmSuspensaoConcessao.btnProcurarClick(Sender: TObject);
begin
  inherited;
    dialog.Filter := '*.xls|*.xlsx';
      if not dialog.Execute then
        Exit
      else
          edtArqEventoCobranca.Text := ExtractFileName(Dialog.FileName);
end;
//Ewerton Beltramini SIG57875 - fim.

//Ewerton Beltramini SIG57875 - inicio.
procedure TfrmSuspensaoConcessao.btnLimpaPartClick(Sender: TObject);
begin
  inherited;
      CmbMotivoBloqueioArquivo.KeyValue := -1;
      edtDataInicialArquivo.date := date;
      edtDataFinalArquivo.date := date;
      Dialog.FileName := '';
      edtArqEventoCobranca.Clear;
      memArquivo.Lines.Clear;
end;
//Ewerton Beltramini SIG57875 - fim.

procedure TfrmSuspensaoConcessao.FormShow(Sender: TObject);
begin
  inherited;
        //Ewerton Beltramini SIG57875 - Inicio.
        qryMotivoArquivo.Close;
        qryMotivoArquivo.Open;
        //Ewerton Beltramini SIG57875 - fim.
end;

end.


