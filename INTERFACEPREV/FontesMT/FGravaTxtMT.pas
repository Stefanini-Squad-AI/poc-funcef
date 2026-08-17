unit FGravaTxtMT;

// Alterações:
{---------------------------------------------------------------------------------------------------
Autor(a)    :  Henrique Massão
Data        :  27/02/2009
Pendência   :  SOL 109421 KINTANA 496332
Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C:
{---------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Rotina      : Varias
Data        : 21/08/2007
Pendência   : 22108
Alteração   : Troca do DateToStr para FormatDateTime.
----------------------------------------------------------------------------------------------------
Autor(a)    : Gleyber
Data        : 26/02/2007
Pendencia   : 22064
Rotina      : SpeedButton1Click e odTxtCanClose
Alteração   : Criação de rotina para aceitar apenas a pasta parametrizada nos parametros do sistema.
----------------------------------------------------------------------------------------------------
Rotina      : GeraArquivoSchema
Autor(a)    : Leo
Pendência   : 18983
Data        : 21/03/2006
Alteração   : ordenação dos campos na montagem do schema
----------------------------------------------------------------------------------------------------
Rotina      : BitBtn2Click , bbtnCalculaClick
Autor(a)    : Leo
Pendência   : 20785
Data        : 22/11/2005
Alteração   : gravação do logtotalprev
----------------------------------------------------------------------------------------------------
Rotina      : bbtnCalculaClick
Autor(a)    : Leo
Pendência   : 18982
Data        : 18/08/2005
Alteração   : modificação para recomeçar a importação da rubrica em que parou
----------------------------------------------------------------------------------------------------
Rotina      : BitBtn2Click
Autor(a)    : Leo
Pendência   : 19931
Data        : 16/08/2005
Alteração   : criticar o recebimento de descontos por módulos de origem antes de desfazer
----------------------------------------------------------------------------------------------------
Autor(a)    : Leo
Data        : 25.05.2004
Alteração   : Inclusão do tratamento da taxa de contribuição TAMEQUIPARACAO e INIEQUIPARACAO
              marcação das rubricas que servem para equiparação salarial
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Augusto
Data        : 10/02/2003
Alteração   : Buscar somente os Planos da Patrocinadora escolhida
----------------------------------------------------------------------------------------------------
Rotina      :
Autor(a)    : Leo
Data        : 23/01/2003
Alteração   : COMPATIBILIDADE COM TODAS AS ALTERAÇÕES NO FGRAVATXT ATÉ HOJE
              PARA TORNAR ESTE O PROCESSO OFICIAL
---------------------------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, URegra, DBTables, CheckLst, TreeWzd, ComCtrls,
  wwriched, wwdblook, wwdbdatetimepicker, CMDateTimePicker, Db, Wwtable,
  DBClient,  uCMClientDataSet,  uCmControlObject, uCtrlImportaFinanc,
  uDbTaberrosccp,  Wwquery, uCmSqlParams   ;

type
  TfrmGravaTxtMT = class(TfrmSairAjuda)
    Panel2: TPanel;
    lblArquivoPatro: TLabel;
    lblDataCobranca: TLabel;
    lblDataRef: TLabel;
    lblPatrocinadora: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    edTxt: TEdit;
    deDataRef: TCMDateTimePicker;
    deDataCob: TCMDateTimePicker;
    dblkPatrocinadora: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    lblHoraIni: TLabel;
    dblkPlanoPrev: TwwDBLookupCombo;
    chkbad: TCheckBox;
    chkInsElegiveis: TCheckBox;
    Panel1: TPanel;
    Panel3: TPanel;
    PageControl1: TPageControl;
    tbDescricao: TTabSheet;
    lbMensagens: TMemo;
    tbErros: TTabSheet;
    memErros: TwwDBRichEdit;
    tbDiverg: TTabSheet;
    mmDivergencias: TMemo;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    memBuscaRubricas: TMemo;
    memBuscaRubricasDuplo: TMemo;
    TwCons: TTreeWzd;
    GroupBox3: TGroupBox;
    clbEtapas: TCheckListBox;
    odTxt: TOpenDialog;
    SaveDialog1: TSaveDialog;
    bmPatro: TBatchMove;
    tblTxt: TwwTable;
    tblDbf: TwwTable;
    BitBtn2: TBitBtn;
    bbtnBaca: TBitBtn;
    bbtnCalcula: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnRel: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    cdsPlano: TCMClientDataSet;
    cdsPatro: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    cdsDadosArquivo: TCMClientDataSet;
    qryTxt: TwwQuery;
    cmsqlCalcContrib: TCMSqlParams;

    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnRelClick(Sender: TObject);
    procedure deDataRefChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCalculaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnBacaClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure memErrosDblClick(Sender: TObject);
    procedure edTxtChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblkPatrocinadoraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure odTxtCanClose(Sender: TObject; var CanClose: Boolean);


  private // Private declarations

    CtrlImportaFinanc : TCtrlImportaFinanc;

    function GeraArquivoSchema(sArquivo: string): Boolean;


  public  // Public declarations


  end;



var
  frmGravaTxtMT: TfrmGravaTxtMT;
  sMesRef,sMesCob,sMesCobGr, sCamposDBF, sMesRefAux : string ;
  F , bad: TextFile ;
  iContadorCommit : Integer;




implementation
{$R *.DFM}
uses
  dRelatorios, UMensErro, USistema, UAdmprev , DBaseDados, UDataBase, umodulo, fAguarde, UCCP;




procedure TfrmGravaTxtMT.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If Not odTxt.Execute
   Then Exit;

  If CriticaPath(odTxt.FileName)
   Then Begin
     MsgDlg('O local do arquivo escolhido possui caracteres inválidos.'+#13+
            'Por favor, mude a localização do arquivo para outra pasta.','Aviso',mtWarning,[mbOk],0);
     Exit;
   End;
  edTxt.Text := odTxt.FileName;
  edTxt.Hint := edTxt.Text;
  if (edtxt.Font.Size * length(edtxt.text)) > edtxt.Width then
     edTxt.ShowHint := true
  else
  edTxt.ShowHint := false;
end;



procedure TfrmGravaTxtMT.bbtnRelClick(Sender: TObject);
begin
  inherited;
  if trim(dblkPatrocinadora.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Patrocinadora','Aviso',mtWarning,[mbOk],0);
     dblkPatrocinadora.SetFocus;
     exit;
  end;

  if trim(deDataCob.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Cobrança','Aviso',mtWarning,[mbOk],0);
     deDataCob.SetFocus;
     exit;
  end;

  with dtmRelatorios do
  begin
     lbltitulocriticas.caption := 'Críticas do Interface - Mês: '+copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+' ';

     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
     qryFundacao.Open;

     qryErrosInterface.Close;
     qryErrosInterface.SQL.Clear;
     qryErrosInterface.SQL.Add(' SELECT DISTINCT T.IDCONTROLE, T.CODPROVENTO , T.VALOR, T.NOMEPATROC, T.DESCSITFUNC, '+
                               ' T.MATRICULA,T.DATAREF, T.MSGEXPLICATIVA, C.NOME '+
                               ' FROM TABERROSCCP T, CONTRIBUICAO C '+
                               ' WHERE T.IDPESSJUR = '''+cdsPatro.fieldbyname('idpessoa').AsString+''' AND '+
                               ' T.MESCOBRANCA = '''+copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+''' AND '+
                               ' T.IDCONTRIBUICAO = C.IDCONTRIBUICAO(+) '+
                               ' ORDER BY T.IDCONTROLE,T.CODPROVENTO, T.MATRICULA ');
     qryErrosInterface.Open;

     rpErrosInterface.Print;
  end;

end;



procedure TfrmGravaTxtMT.deDataRefChange(Sender: TObject);
begin
  inherited;
  deDataCob.Date := deDataRef.Date;
end;



procedure TfrmGravaTxtMT.FormCreate(Sender: TObject);
begin
  inherited;
  //Henrique Massão
  OdTxt.InitialDir:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

  deDataCob.Date:=Date;
  deDataRef.Date:=Date;


  CtrlImportaFinanc := TCtrlImportaFinanc.Create;
  CtrlImportaFinanc.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);

  cdsPatro.Data := CtrlImportaFinanc.ListaPatro;
  cdsPlano.Data := CtrlImportaFinanc.ListaPlano(cdsPatro.FieldByName('IDPESSOA').AsInteger);
end;



procedure TfrmGravaTxtMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlImportaFinanc.free;
  inherited;
end;



function TfrmGravaTxtMT.GeraArquivoSchema(sArquivo: string): Boolean;
var
  i, iInicio, x, j : integer; lista, listaFim :TStringList;
begin
  Result := True;
  i := 1;
  try
   lista := TStringList.Create;
   listaFim := TStringList.Create;

   with lista do
   begin
     Add('[' + Copy(ExtractFileName(Trim(sArquivo)), 1, Length(ExtractFileName(Trim(sArquivo))) - 4) + ']');

     Add('Filetype=Fixed');
     Add('CharSet=ascii');


     ///
     /// Gerar Schema de acesso ao arquivo
     /// Só insiro o registro no schema se o mesmo não possuir inicio = 1000
     ///

     //Campo especial para especificar qual o Tipo de Lançamento que está vindo no Txt;
     if cdsDadosArquivo.FieldByName('FLGLANCAMENTO').AsString = 'S' then begin
        if Trim(cdsDadosArquivo.FieldByName('POSLANCAMENTO').AsString) <> '1000' then begin
           Add('Field'+inttostr(i)+'=LANCAMENTO,Char, 1, 00, ' + Trim(cdsDadosArquivo.FieldByName('POSLANCAMENTO').AsString));
           sCamposDBF := sCamposDBF + 'DBF.LANCAMENTO, ';
           inc(i);
        end;
     end;


     if Trim(cdsDadosArquivo.FieldByName('INIPATRO').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=PATRO,Char,' + Trim(cdsDadosArquivo.FieldByName('PATRO').AsString) + ',00,' +
                                   Trim(cdsDadosArquivo.FieldByName('INIPATRO').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.PATRO, ';
        inc(i);
     end;


     if Trim(cdsDadosArquivo.FieldByName('INIDATAREF').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=DATAREF,Char,' + Trim(cdsDadosArquivo.FieldByName('DATAREF').AsString) + ',00,' +
                                     Trim(cdsDadosArquivo.FieldByName('INIDATAREF').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.DATAREF, ';
        inc(i);
     end;


     if  Trim(cdsDadosArquivo.FieldByName('INITIPOCHAVE').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=TIPOCHAVE,Char,' + Trim(cdsDadosArquivo.FieldByName('TIPOCHAVE').AsString) + ',00,' +
                                       Trim(cdsDadosArquivo.FieldByName('INITIPOCHAVE').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.TIPOCHAVE, ';
        inc(i);
     end;

     if  Trim(cdsDadosArquivo.FieldByName('INIVALORCHAVE').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=VALORCHAVE,Char,' + Trim(cdsDadosArquivo.FieldByName('VALORCHAVE').AsString) + ',00,' +
                                         Trim(cdsDadosArquivo.FieldByName('INIVALORCHAVE').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.VALORCHAVE, ';
        inc(i);
     end;


     if Trim(cdsDadosArquivo.FieldByName('INIPROVENTO').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=PROVENTO,Char,' + Trim(cdsDadosArquivo.FieldByName('PROVENTO').AsString) + ',00,' +
                                      Trim(cdsDadosArquivo.FieldByName('INIPROVENTO').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.PROVENTO, ';
        inc(i);
     end;


     if Trim(cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=SEQINTERFA,Char,' + Trim(cdsDadosArquivo.FieldByName('SEQINTERFA').AsString) + ',00,' +
                                        Trim(cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.SEQINTERFA, ';
        inc(i);
     end;

     //criar campo de parcela para a Funcef -  PROVISÓRIO
     Add('Field'+inttostr(i)+'=PARCELA,Char,3,00,15');
     sCamposDBF := sCamposDBF + 'DBF.PARCELA, ';
     inc(i);


     if Trim(cdsDadosArquivo.FieldByName('INIVALORPROVE').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=VALORPROVE,Char,' + Trim(cdsDadosArquivo.FieldByName('VALORPROVE').AsString) + ',00,' +
                                        Trim(cdsDadosArquivo.FieldByName('INIVALORPROVE').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.VALORPROVE, ';
        inc(i);
     end;


     if  Trim(cdsDadosArquivo.FieldByName('INIVALORPART').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=VALORPART,Char,'+ Trim(cdsDadosArquivo.FieldByName('VALORPART').AsString) + ',00,' +
                                       Trim(cdsDadosArquivo.FieldByName('INIVALORPART').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.VALORPART, ';
        inc(i);
     end;


     if  Trim(cdsDadosArquivo.FieldByName('INIIDPESSOA').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=IDPESSOA,Char,'+ Trim(cdsDadosArquivo.FieldByName('TAMIDPESSOA').AsString) + ',00,' +
                                       Trim(cdsDadosArquivo.FieldByName('INIIDPESSOA').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.IDPESSOA, ';
        inc(i);
     end;

     if Trim(cdsDadosArquivo.FieldByName('INIPLANO').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'= IDPLANO,Char,' + Trim(cdsDadosArquivo.FieldByName('PLANO').AsString) + ',00,' +
                                   Trim(cdsDadosArquivo.FieldByName('INIPLANO').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.IDPLANO, ';
        inc(i);
     end;


     if Trim(cdsDadosArquivo.FieldByName('INIMESREF').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=MESREF,Char,' + Trim(cdsDadosArquivo.FieldByName('MESREF').AsString) + ',00,' +
                                    Trim(cdsDadosArquivo.FieldByName('INIMESREF').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.MESREF, ';
        inc(i);
     end;


     if Trim(cdsDadosArquivo.FieldByName('INIEQUIPARACAO').AsString) <> '1000' then begin
        Add('Field'+inttostr(i)+'=EQUIPARA,Char,' + Trim(cdsDadosArquivo.FieldByName('TAMEQUIPARACAO').AsString) + ',00,' +
                                        Trim(cdsDadosArquivo.FieldByName('INIEQUIPARACAO').AsString) );
        sCamposDBF := sCamposDBF + 'DBF.EQUIPARA, ';
        inc(i);
     end;



     //caso o usuário cadastre os campos(inicio, tamanho) diferente da ordem acima, o arquivo de esquema vai
     //ficar errado pois terá "fields" posteriores com inicio anterior.
     listafim.add(lista[0]); //cabeçalho 1, igual
     listafim.add(lista[1]); //cabeçalho 2, igual
     listafim.add(lista[2]); //cabeçalho 3, igual
     x := 1; //começo das linhas de campos

     for j := 0 to 999 do
     begin
        for i := 3 to lista.Count - 1 do //começo das linhas de campos
        begin
           if j = strtoint(copy(lista[i],pos('00,',lista[i])+3,5)) then
           begin
              listafim.add('Field'+inttostr(x)+copy(lista[i],pos('=',lista[i]),length(lista[i])));
              inc(x);
           end;
        end;
     end;

     //Salvando o arquivo de Schema(*.sch);
     listafim.SaveToFile(Copy(edTxt.Text, 1, Length(edTxt.Text) - 4) + '.sch');
   

     lista.Free;
     listafim.free;

   end;
   except
     Result := False;
  end;
end;



procedure TfrmGravaTxtMT.bbtnCalculaClick(Sender: TObject);
var
  sMesRefGr ,  sMesCobGr ,
  sDataRef ,  sIdPessjur,   sDigito, sMesRef13,
  sProvento,
  sCodProvDescSalBenef,
  sCodProvDescRemTotal,
  sCodProvDescSalPart,
  sCodProvDescSal13,
  sNomePatro  : String;

  bInsereClasseRubricas, bCobra13 : Boolean;

  iIdLote, iIniDigito,
  iIdRubSalBenef,
  iIdRubRemTotal,
  iIdRubSalPart,
  iIdRubSal13 : Integer;

  sUltRubrica : String;
begin
  inherited;

  Modulo.GravaLogTOTALPREV (copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+' - v. '+Sistema.Versao+' - Import. Financeira - arq. '+edTxt.Text);

  TwCons.Etapa.Pos       := -1;

  try
     CloseFile(F);
     CloseFile(bad);
  except
  end;

  lblHoraIni.Caption:=TimeToStr(Time);
  bbtnCalcula.Enabled := false;
  lbMensagens.Lines.Clear;
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando o processo');
  Application.ProcessMessages;
  //
  if trim(edTxt.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Arquivo da Patrocinadora','Aviso',mtWarning,[mbOk],0);
     bbtnCalcula.Enabled := true;

     exit;
  end;
  //
  if trim(dblkPatrocinadora.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Patrocinadora','Aviso',mtWarning,[mbOk],0);
     dblkPatrocinadora.SetFocus;
     bbtnCalcula.Enabled := true;
     exit;
  end;
  //
  if trim(dblkPlanoPrev.Text) = '' then begin
     if MsgDlg('O plano não foi selecionado, deseja processar todos os planos ?','Confirmação',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     begin
        dblkPlanoPrev.SetFocus;
        bbtnCalcula.Enabled := true;
        exit;
     end;
  end;
  //
  if trim(deDataRef.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Referencia','Aviso',mtWarning,[mbOk],0);
     deDataRef.SetFocus;
     bbtnCalcula.Enabled := true;
     exit;
  end;
  //
  if trim(deDataCob.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Cobrança','Aviso',mtWarning,[mbOk],0);
     deDataCob.SetFocus;
     bbtnCalcula.Enabled := true;
     exit;
  end;


  //inicializa variáveis
  sMesRefGr    := copy(deDataRef.Text,7,4)+'/'+copy(deDataRef.Text,4,2);
  sMesCobGr    := copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2);
  sMesCob      := copy(deDataRef.Text,4,2)+copy(deDataRef.Text,7,4);
  sDataRef     := deDataRef.Text;
  sMesRef13  := copy(deDataRef.Text,7,4)+'/13';
  sIdPessjur   := cdspatro.fieldbyname('idpessoa').AsString;
  sIdPlanoPrev := '';
  if trim(dblkPlanoPrev.text) <> '' then
     sIdPlanoPrev := cdsPlano.fieldbyname('idplanoprev').AsString;
  bInsereClasseRubricas := True;
  sProvento      :='-10';
  sNomePatro := cdsPatro.fieldbyname('nome').AsString;
  //fim de inicialização de variáveis



  CtrlImportaFinanc.bCritHistRubSal := true;

  //verifica se alguma contribuição é enviada para patrocinadora
  //caso não, não usar a CLASSERUBRICAS pois as contribuições não serão recalculadas
  //inserrir/atualizar direto TMPDESC
  cdsAux.data := CtrlImportaFinanc.VerificaExisteIda(sIdpessjur, sIdPlanoPrev);
  if cdsAux.isempty then
     bInsereClasseRubricas := False;



  //cria lote
  iIdLote := CtrlImportaFinanc.InsereLote(sMesCobGr, sIdpessjur,
                                          Copy('Contribuições descontadas em folha - '+sNomePatro,1,200) );



  //tratamento de arquivos

  AssignFile(F,'Log' +
             copy(FormatDateTime('dd/mm/yyyy', date),1,2) +
             copy(FormatDateTime('dd/mm/yyyy', date),4,2) +
             copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '.err');

  Rewrite(F);

  WriteLn(F,'Log de Erros durante o processo iniciado em ' +
          FormatDateTime('dd/mm/yyyy', date) + ' as '+timetostr(time)+'...');

  //verifica se gera arquivo bad, de registros rejeitados
  if chkbad.checked then
  begin
     AssignFile(bad,ChangeFileExt(ExtractFileName(edTxt.Text),'.BAD'));
     rewrite(bad);
  end;

  qryTxt.DatabaseName := ExtractFilePath(edTxt.Text);
  tblTxt.DatabaseName := ExtractFilePath(edTxt.Text);
  tblTxt.TableName    := ExtractFileName(edTxt.Text);
  //
  tblDbf.DatabaseName := ExtractFilePath(edTxt.Text);
  tblDbf.TableName    := 'tmptxt.DBF';
  //

  cdsDadosArquivo.data := CtrlImportaFinanc.ListaDadosLayOut(sIdpessjur);


  //
  sCamposDBF := '';
  // Criar o arquivo de lay-out do arquivo texto que está sendo importado.
  if not GeraArquivoSchema(edTxt.Text) then begin;
     MsgDlg('Erro ao criar o arquivo esquema de recebimento!','Erro',mtError,[mbOk],0);
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
     CloseFile(F);
     if chkbad.checked then   CloseFile(bad);
     bbtnCalcula.Enabled := true;
     exit;
  end;

  Screen.Cursor:=crHourGlass;
  //fim tratamento de arquivos


  //
  // Apaga a CLASSERUBRICAS se a opção Histórico de Rubricas for escolhido
  //
  TwCons.Etapa.Pos       := 1;
  iContadorCommit := 0;
  if clbEtapas.Checked[0] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Esvaziando tabela temporária do banco de dados ');
     Application.ProcessMessages;
     if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

     CtrlImportaFinanc.ExcluiClasseRubricas;

     if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
  end;


  //testa máscaras que têm dígito, mas não tem separador, exemplo FUNCEF
  sDigito := '';
  iIniDigito := pos('D',uppercase(cdsPatro.FieldByName('MASCMATRICULA').AsString)) - 1;
  if iIniDigito <= 0 then
     begin
        iIniDigito := pos('-',uppercase(cdsPatro.FieldByName('MASCMATRICULA').AsString)) -1;
        sDigito := '-';
     end;


  lbMensagens.Lines.Add(TimeToStr(Time)+' - Abrindo Arquivo TXT');
  Application.ProcessMessages;
  try
     /// Abro o dbf para alterar o tipo de campo
     tblTxt.Open;

     lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando a criação do arquivo temporário');
     Application.ProcessMessages;
     bmPatro.RecordCount := 0;
     try
        bmPatro.Execute;
     except
        MsgDlg('Erro ao abrir arquivo texto causado por inconsistência no '+#13+
               'cadastro de lay-out. Verifique arquivo de Esquema(sch) gerado '+#13+
               'no mesmo diretório do arquivo texto.','Erro',mtError,[mbOk],0);
        lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
        bbtnCalcula.Enabled := true;
        CloseFile(F);
        if chkbad.checked then   CloseFile(bad);
        exit;
     end;


     /// Se necessário retirar os registros de cabeçalho e rodapé
     if cdsDadosArquivo.FieldByName('FLGHEADER').AsString = 'S' then begin
        with tblDbf do begin
           Open;
           First;
           Delete;
           Close;
        end;

     end;
     if cdsDadosArquivo.FieldByName('FLGFOOTER').AsString = 'S' then begin
        with tblDbf do begin
           Open;
           Last;
           Delete;
           Close;
        end;
     end;

  finally
     tblTxt.Close;
  end;

  //
  // Verificar os proventos existentes para a patrocinadora
  //
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando teste de Rubricas ');
  Application.ProcessMessages;

  with qryTxt do begin
     SQL.Clear;
     SQL.Add('SELECT DISTINCT DBF.PROVENTO ');
     SQL.Add('FROM  TMPTXT DBF ');

     //caso o mesmo provento use o mesmo código
     //este pode estar com alguma letra
     //então não pode ser tratado como numérico
     //como no caso do Serpros
     //no entanto, num caso como o da CBS em que o código vem com seroz a esquerda
     //no arquivo e é cadastrado sem zeros, esse tratamento é necessário
     if cdsDadosArquivo.FieldByName('CODPROVDUPLO').AsString = '0' then
     begin
        SQL.Add('WHERE DBF.PROVENTO NOT IN ( ');
        SQL.Add('SELECT DISTINCT RP.CODPROVDESC FROM ":BASEDADOS:RUBRICAXPESS" RP WHERE RP.IDPESSOA = '+sIdPessjur+'   ) ');
     end
     else
     begin
        SQL.Add('WHERE TRIM(DBF.PROVENTO) NOT IN ( ');
        SQL.Add('SELECT DISTINCT TRIM(RP.CODPROVDESC) FROM ":BASEDADOS:RUBRICAXPESS" RP WHERE RP.IDPESSOA = '+sIdPessjur+'    ) ');
     end;


     Open;

     if not IsEmpty then begin
        First;
        while not EOF do begin
           mmDivergencias.Lines.Add('Código da rubrica da Patrocinadora não associada no Sistema - ' + FieldByName('PROVENTO').AsString);
           lbMensagens.Lines.Add('Código da rubrica da Patrocinadora não associada no Sistema - ' + FieldByName('PROVENTO').AsString);

           CtrlImportaFinanc.GravaErrosCCP(qrytxt, cdsdadosarquivo,
                         bad, chkInsElegiveis.checked,
                         1, sIdPessjur, 'Rubrica não associada.',
                         ' ', FieldByName('PROVENTO').AsString,
                         sDataRef, 0,'',sMesCob,sNomePatro);
           Next;
        end;
        Application.ProcessMessages;

        mmDivergencias.Lines.SaveToFile(ExtractFilePath(edTxt.Text) + '\Div' +
                                        copy(FormatDateTime('dd/mm/yyyy', date),1,2) +
                                        copy(FormatDateTime('dd/mm/yyyy', date),4,2) +
                                        copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '.err');


        if Msgdlg('Existe(m) '+ inttostr(recordcount)+' rubrica(s) não associada(s) a patrocinadora, continua sem consertar ?','Confirmação',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          if msgdlg('Poderá ser calculado o salário participação com erro, quer realmente continuar?','Confirmação',
          mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          begin
            lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
            bbtnCalcula.Enabled := true;
            CloseFile(F);
            if chkbad.checked then    CloseFile(bad);
            exit;
          end
        end
        else
        begin
           lbMensagens.Lines.Add(TimeToStr(Time)+' - Processo abortado...');
           bbtnCalcula.Enabled := true;
           CloseFile(F);
           if chkbad.checked then   CloseFile(bad);
           bbtnCalcula.Enabled := true;
           exit;
        end;
     end;
     Close;
  end;



  lbMensagens.Lines.Add(TimeToStr(Time)+' - Verificando se já foi gravado algum dado de contribuição');
  Application.ProcessMessages;
  //


  iIdRubSalBenef       := cdsPatro.FieldByName('IdRubSalBeneficio').AsInteger;
  //
  iIdRubRemTotal       := cdsPatro.FieldByName('IdRubRemTotal').AsInteger;
  //
  iIdRubSalPart        := cdsPatro.FieldByName('IDRUBSALPARTICIP').AsInteger;
  //
  CtrlImportaFinanc.SelecionaCodRubricas(sidpessjur,iIdRubSalBenef,
                                                    iIdRubRemTotal,
                                                    iIdRubSalPart,
                                                    iIdRubSal13,
                                                    strtoint(copy(sMesCobGr,1,4)),
                                                    sCodProvDescSalBenef,
                                                    sCodProvDescRemTotal,
                                                    sCodProvDescSalPart,
                                                    sCodProvDescSal13,
                                                    bCobra13 );


  ///
  /// Se a opção Histórico de Rubricas estiver marcada
  /// processa a gravação de rubricas
  TwCons.Etapa.Pos       := 2;
  iContadorCommit := 0;
  if clbEtapas.Checked[0] then begin

      lbMensagens.Lines.Add(TimeToStr(Time)+' - Filtrando e classificando informações do arquivo temporário');
      Application.ProcessMessages;

      with qryTxt do begin
          SQL.Clear;
          SQL.Add('SELECT DISTINCT '+Copy(sCamposDBF, 1, Length(sCamposDBF) - 2) );
          SQL.Add('FROM  TMPTXT DBF  ');
          SQL.Add('ORDER BY DBF.PROVENTO ');

          if  Trim(cdsDadosArquivo.FieldByName('INIIDPESSOA').AsString) <> '1000' then
              SQL.Add(' ,DBF.IDPESSOA ')
          else SQL.Add(' , DBF.VALORCHAVE ');

          if Trim(cdsDadosArquivo.FieldByName('INICIOSEQINTERFA').AsString) <> '1000' then
             SQL.Add(' ,DBF.SEQINTERFA');


          Open;
          if isEmpty then begin
             lbMensagens.Lines.Add(TimeToStr(Time)+' - Não há contribuições a serem calculadas. Processo abortado!');
             CloseFile(F);
             if chkbad.checked then   CloseFile(bad);
             bbtnCalcula.Enabled := true;
             Exit;
          end;
      end;

      //
      lbMensagens.Lines.Add(TimeToStr(Time)+' - Inicio da gravação das rubricas e contribuições');
      Application.ProcessMessages;


      if CtrlImportaFinanc.VerificaImportAnterior(sIdPessjur,sMesCobGr,sUltRubrica) then
      begin
         if MsgDlg('Já existem rubricas importadas neste mês. Deseja refazer a importação?','Confirmação',
            mtConfirmation, [mbYes, mbNo], 0) = mrNo then
         begin
            bbtnCalcula.Enabled := true;
            lbMensagens.Lines.Add(TimeToStr(Time)+' - Importação interrompida pelo usuário.');
            exit;
         end
         else
         begin
            if MsgDlg('A última rubrica importada foi a '+sUltRubrica+'. Deseja recomeçar desta rubrica? (respondendo NÃO, a importação será refeita integralmente)','Confirmação',
               mtConfirmation, [mbYes, mbNo], 0) = mrNo
            then sUltRubrica := '';
         end;
      end;


      if not CtrlImportaFinanc.ImportaRubricas(qryTxt,
                               cdsDadosArquivo ,
                               F, bad ,
                               chkbad.checked, bInsereClasseRubricas ,
                               mmDivergencias, lbMensagens, memBuscaRubricasDuplo ,memBuscaRubricas, memErros ,
                               sIdPessjur, sMesRefGr, sMesRef13,sMesCobGr, sDataRef, deDataCob.text,  sDigito, sNomePatro,
                               sCodProvDescSalPart, sCodProvDescSal13, sCodProvDescRemTotal,
                               iIniDigito, iIdLote, iIdRubSalBenef, iIdRubRemTotal, iIdRubSalPart, iIdRubSal13,
                               sUltRubrica)
      then
      begin
         bbtnCalcula.Enabled := true;
         CloseFile(F);
         if chkbad.checked then  CloseFile(bad);
         exit;
      end;

      //
  end;   // clbEtapas




  ///
  /// Se a opção de Atualização de Salário de Participação estiver marcada
  /// então executa esta etapa
  if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
  iContadorCommit := 0;
  if clbEtapas.Checked[1] then begin

      lbMensagens.Lines.Add(TimeToStr(Time)+' - Gravando o Salário de Participação');
      Application.ProcessMessages;

      if not CtrlImportaFinanc.GravaSalarios(qrytxt,cdsDadosArquivo ,
                               F , bad,
                               mmDivergencias, lbMensagens,
                               memErros,
                               sIdPessjur, sIdPlanoPrev,  sMesRefGr , sMesRef13,sMesCobGr,
                               sCodProvDescSalPart, sCodProvDescSal13 ,
                               iIdRubSalBenef, iIdRubRemTotal,
                               iIdRubSalPart, iIdRubSal13)
      then
      begin
         bbtnCalcula.Enabled := true;
         if chkbad.checked then  CloseFile(bad);
         CloseFile(F);
         exit;
      end;



  end;


  TwCons.Etapa.Pos     := 3;
  iContadorCommit := 0;
  if clbEtapas.Checked[2] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Calculando as Contribuições dos Participantes');
     Application.ProcessMessages;

     if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

     if bInsereClasseRubricas then
        CtrlImportaFinanc.GravaContribuicoes(qryTxt ,
                           cdsDadosArquivo,
                           F , mmDivergencias, lbMensagens ,
                           memErros ,
                           sIdPessjur, sMesRefGr, sMesRef13,sMesCobGr,
                           sDataRef, deDataCob.text, sNomePatro,
                           cmsqlCalcContrib , iIdLote  );
     bbtnCalcula.Enabled := true;

     if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
  end;


  iContadorCommit := 0;
  if clbEtapas.Checked[3] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Inserindo as Contribuições Não Recebidas');
     Application.ProcessMessages;
  end;


  //
  iContadorCommit := 0;
  if clbEtapas.Checked[4] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Inserindo as Contribuições Não Associadas dos Participantes descontadas na patrocinadora');
     Application.ProcessMessages;
  end;
  //


  TwCons.Etapa.Pos       := 4;
  iContadorCommit := 0;
  if clbEtapas.Checked[1] then begin
     if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

     CtrlImportaFinanc.GravaTotSalarios(F ,
                           mmDivergencias, lbMensagens ,
                           memErros ,
                           sIdPessjur, sMesRefGr, bCobra13,
                           iIdRubSalPart, iIdRubSal13);
     bbtnCalcula.Enabled := true;

     if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;

  end; //if [0]



  if clbEtapas.Checked[2] then
  begin
     frmaguarde.Mostra('Montando Demonstrativo de divergências');

     if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

     CtrlImportaFinanc.MontaDemonstrativo(qryTxt,
                                    CdsDadosArquivo ,
                                    F, bad ,
                                    mmDivergencias, lbMensagens ,
                                    memErros ,
                                    sIdPessjur, sMesRef, sMesCob, sNomePatro,
                                    bInsereClasseRubricas,
                                    frmaguarde );
     bbtnCalcula.Enabled := true;

     if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
     frmaguarde.Apaga;
     //fim do demonmstrativo de divergências
  end; // if clbEtapas.Checked[2]



  TwCons.Etapa.Pos       := 5;
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Término do Processamento');
  Application.ProcessMessages;
  bbtnCalcula.Enabled := True;

  WriteLn(F,'ERRO' +
          Copy(FormatDateTime('dd/mm/yyyy', Date),1,2) +
          Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) +
          Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '.LOG');

  lbMensagens.Lines.SaveToFile('MENS' +
                               Copy(FormatDateTime('dd/mm/yyyy', Date),1,2) +
                               Copy(FormatDateTime('dd/mm/yyyy', Date),4,2) +
                               Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '.LOG');

  mmDivergencias.Lines.SaveToFile(trim(edTxt.Text) + 'Div'  +
                                  copy(FormatDateTime('dd/mm/yyyy', date),1,2) +
                                  copy(FormatDateTime('dd/mm/yyyy', date),4,2) +
                                  copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '.err');

  CloseFile(F);
  if chkbad.checked then   CloseFile(bad);

  Screen.Cursor:=crDefault;


  if clbEtapas.Checked[2] then
  begin
     if MsgDlg('Deseja visualizar o relatório de críticas ?', 'Confirmação',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes     then
        bbtnRelClick(self);
  end;
end;



procedure TfrmGravaTxtMT.FormShow(Sender: TObject);
begin
  inherited;

  WindowState := wsMaximized;
  TwCons.Etapa.Pos       := -1;

  If Trim(prmPathAutorRec) <> ''
   Then odTxt.InitialDir := prmPathAutorRec
   //Henrique Massão
   //Else odTxt.InitialDir := 'C:\';
   Else odTxt.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
end;



procedure TfrmGravaTxtMT.BitBtn2Click(Sender: TObject);
var
  sMesCob, sMesRef, sPlano, sIdPlanoPrev : string;
  ra : integer;
begin
  inherited;

  if trim(edTxt.Text) = '' then begin
     MsgDlg('Obrigatório preencher o Arquivo da Patrocinadora','Aviso',mtWarning,[mbOk],0);
     exit;
  end;
  //
  if trim(dblkPatrocinadora.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Patrocinadora','Aviso',mtWarning,[mbOk],0);
     dblkPatrocinadora.SetFocus;
     exit;
  end;
  //
  if trim(dblkPlanoPrev.Text) = '' then begin
     if Msgdlg('O plano não foi selecionado, deseja processar todos os planos ?','Confirmação',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then
     begin
        dblkPlanoPrev.SetFocus;
        exit;
     end;
  end;
  //
  if trim(deDataRef.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Referencia','Aviso',mtWarning,[mbOk],0);
     deDataRef.SetFocus;
     exit;
  end;
  //
  if trim(deDataCob.Text) = '' then begin
     MsgDlg('Obrigatório preencher a Data de Cobrança','Aviso',mtWarning,[mbOk],0);
     deDataCob.SetFocus;
     exit;
  end;

  lbMensagens.Lines.Clear;
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Iniciando o processo');
  Application.ProcessMessages;

  sMesCob  := copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2);
  sMesRef  := copy(deDataRef.Text,7,4)+'/'+copy(deDataRef.Text,4,2);



  //testar se já houve recebimento feito por algum módulo de origem, caso sim,
  //não deixar que o desfazimento continue
  sIdPlanoPrev := '';
  if trim(dblkPlanoPrev.text) <> '' then
  sIdPlanoPrev := cdsPlano.fieldbyname('idplanoprev').AsString;

  cdsAux.data := CtrlImportaFinanc.VerificaExisteRecebOrigem(cdspatro.fieldbyname('idpessoa').AsString,
                                                             sIdPlanoPrev, sMesCob);

  if not cdsaux.isempty then
  begin
     MsgDlg('Não é possível desfazer pois algum módulo de origem(AdmPrev, Empréstimo, Assistencial) '+
            'já faz o seu recebimento.','Informação',mtInformation,[MbOk,MbHelp],0);
     Exit;
  end;

  if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

  Modulo.GravaLogTOTALPREV (copy(deDataCob.Text,7,4)+'/'+copy(deDataCob.Text,4,2)+' - v. '+Sistema.Versao+' - Desfazer Import. Financeira');

  // desfaz a gravação na Histrubsal do CCP
  if clbEtapas.Checked[0] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Desfazendo histórico de rubricas');
     Application.ProcessMessages;


     CtrlImportaFinanc.DesfazHistRubSal( mmDivergencias, lbMensagens ,
                       memErros ,
                       cdspatro.fieldbyname('idpessoa').AsString,
                       sIdPlanoPrev,
                       sMesRef, sMesCob );

  end;


  if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

  if clbEtapas.Checked[2] then begin
     lbMensagens.Lines.Add(TimeToStr(Time)+' - Desfazendo tabela de importação de rubricas');
     Application.ProcessMessages;

     CtrlImportaFinanc.DesfazTmpDesc( mmDivergencias, lbMensagens ,
                       memErros ,
                       cdspatro.fieldbyname('idpessoa').AsString,
                       sIdPlanoPrev,
                       sMesRef, sMesCob );
  end;

  lbMensagens.Lines.Add(TimeToStr(Time)+' - Desfazendo o histórico de rubricas da patrocinadora');
  Application.ProcessMessages;

  if not dtmBaseDados.dbBaseDados.InTransaction then StartTransacao;

  CtrlImportaFinanc.DesfazHstRubricaxPess( mmDivergencias, lbMensagens ,
                       memErros ,
                       cdspatro.fieldbyname('idpessoa').AsString,
                       sIdPlanoPrev,
                       sMesRef, sMesCob );

  if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
  lbMensagens.Lines.Add(TimeToStr(Time)+' - Término do processamento');

end;



procedure TfrmGravaTxtMT.bbtnBacaClick(Sender: TObject);
var
  iPatro : Integer;
begin
  inherited;
end;



procedure TfrmGravaTxtMT.PageControl1Change(Sender: TObject);
begin
  inherited;

  if ( pageControl1.ActivePage.TabIndex = 1 ) AND ( memerros.Lines.Text = '' ) then
  begin

    if FileExists('Log' +
                  copy(FormatDateTime('dd/mm/yyyy', date),1,2) +
                  copy(FormatDateTime('dd/mm/yyyy', date),4,2) +
                  copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '.err') then
    Begin
       memerros.Lines.LoadFromFile('Log' +
                                   copy(FormatDateTime('dd/mm/yyyy', date),1,2) +
                                   copy(FormatDateTime('dd/mm/yyyy', date),4,2) +
                                   copy(FormatDateTime('dd/mm/yyyy', date),7,4) + '.err');
    End;
  end;
end;



procedure TfrmGravaTxtMT.memErrosDblClick(Sender: TObject);
begin
  inherited;
  memErros.execute;
end;



procedure TfrmGravaTxtMT.edTxtChange(Sender: TObject);
begin
  inherited;
  edTxt.Hint := edTxt.Text;
  if (edtxt.Font.Size * length(edtxt.text)) > edtxt.Width then
     edTxt.ShowHint := true
  else
  edTxt.ShowHint := false;
end;

procedure TfrmGravaTxtMT.FormActivate(Sender: TObject);
var i : Integer;
begin
  inherited;
  /// Checar todas as etapas
  for i := 0 to (clbEtapas.Items.Count - 1) do clbEtapas.Checked[i] := true;
end;



procedure TfrmGravaTxtMT.dblkPatrocinadoraCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPlano.Data := CtrlImportaFinanc.ListaPlano(cdsPatro.FieldByName('IDPESSOA').AsInteger);
end;



procedure TfrmGravaTxtMT.odTxtCanClose(Sender: TObject; var CanClose: Boolean);
var
 sPath : string;
begin
  inherited;

  If odTxt.InitialDir = odTxt.FileName Then
    sPath := prmPathAutorRec
  Else
    sPath := Copy(ExtractFilePath(odTxt.FileName),1, Length(ExtractFilePath(odTxt.FileName))-1) ;

  CanClose := True;

  If (Trim(prmPathAutorRec) <> '') And (sPath <> prmPathAutorRec ) Then
  Begin
    MsgDlg('O local do arquivo escolhido não é autorizado.' + #13 +
           'Escolha arquivos somente do endereço: ' + prmPathAutorRec + '.', 'Aviso', mtWarning, [mbOk], 0);
    Repaint;
    CanClose := False;
  end;
end;



end.
