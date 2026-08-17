//------------------------------------------------------------------------------
// Autor(a)    : Peterson Victor
// Data        : 05/09/2016
// Pendência   : SIG28170
// Alteração   : Realizar o Insert na tabela HISTOPIR
//------------------------------------------------------------------------------
// Autor(a)    : Helio Lima Custódio
// Data        : 29/03/2016
// Pendência   : SOL 253577/18209 KINTANA 1345077
// Alteração   : Inserir PlanoPrevContab na Inscrição do Participante em Lote.
//------------------------------------------------------------------------------
// Autor(a)    : Willamy Henrique
// Data        : 09/09/2014
// Pendência   : SOL 238766 KINTANA 507450
// Alteração   : Desenvolver funcionalidade para cadastro em lote
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// Autor(a)    : William Santana
// Data        : 20/12/2013
// Pendência   : SOL 180408 KINTANA 1698323
// Alteração   : Desenvolver funcionalidade para cadastro em lote das seguintes
//               informações: Opção de IR e Proposta recebida
//------------------------------------------------------------------------------
// Autor(a)    : Felipe A. Santos
// Data        : 28/11/2013
// Pendência   : SOL 180408 KINTANA 1698323
// Alteração   : Desenvolver funcionalidade para cadastro em lote das seguintes
//               informações: Opção de IR e Proposta recebida
//------------------------------------------------------------------------------
// Autor(a)    : Tadeu Passos
// Data        : 14/06/2013
// Pendência   : SOL 180408 KINTANA 1698323
// Alteração   : Desenvolver funcionalidade para cadastro em lote das seguintes
//               informações: Opção de IR e Proposta recebida
//------------------------------------------------------------------------------
// Autor(a)    : Fanuel Junior
// Data        : 18/03/2010
// Pendência   : SOL 154361  Kintana 1188271
// Alteração   : Eliminado o campo Data de Inscrição Caixa da tela Inscrição em
// Lote e também do Arquivo TXT.
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Xavier
// Data        : 05/11/2010
// Pendência   : SOL 147055 Kintana 1010747
// Alteração   : inconsistência na gravação do mês no arquivi txt. alterada a
//               função para que considere apenas dias uteis
//------------------------------------------------------------------------------
// Autor(a)    : Fernando Santana
// Data        : 05/10/2010
// Pendência   : SOL 145293 Kintana 970786
// Alteração   : Alterar posiçõe do arq txt.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 12/07/2010
// Pendência   : SOL 127062 Kintana 670853
// Alteração   : Criação da funcionalidade "Inscricao Participante em Lote"
//------------------------------------------------------------------------------

unit FInscricaoParticipanteLote;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, ppCtrls, ppPrnabl, ppClass,
  ppBands, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppDB, ppDBPipe;

type
  TfrmInscricaoParticipanteLote = class(TfrmCadastroCS)
    GroupBox1: TGroupBox;
    dbgrdParticipantes: TwwDBGrid;
    btnExcluir: TBitBtn;
    btnLimpar: TBitBtn;
    GroupBox2: TGroupBox;
    chkpdf: TCheckBox;
    chktxt: TCheckBox;
    chkXls: TCheckBox;
    chkRelatorio: TCheckBox;
    btnArquivo: TSpeedButton;
    QryGrid: TQuery;
    dsGrid: TDataSource;
    updGrid: TUpdateSQL;
    btnGerar: TSpeedButton;
    QryAux: TQuery;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppPipeLine: TppDBPipeline;
    QryRelatorio: TQuery;
    dsRelatorio: TDataSource;
    ppFooterBand1: TppFooterBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppDBText1: TppDBText;
    ppDBText6: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLblDataCaixa: TppLabel;
    ppDBText5: TppDBText;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel4: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    chkSel: TCheckBox;
    QryGridSEL: TFloatField;
    QryGridNOVAMATRICULA: TFloatField;
    QryGridMATRICULA: TStringField;
    QryGridIDPESSJUR: TFloatField;
    QryGridIDPESSOA: TFloatField;
    QryGridNOME: TStringField;
    QryGridPERCENTUAL: TFloatField;
    QryGridPLANOPREV: TFloatField;
    QryGridPLANO: TStringField;
    QryGridDATAINSCRICAO: TStringField;
    QryGridOPCAOIR: TFloatField;
    QryGridDESCOPCAOIR: TStringField;
    QryGridINSCRICAODATA: TStringField;
    QryGridDATAOPCAOIR: TStringField;
    QryGridPOSSUIPLANOATIVO: TFloatField;
    QryGridDATAEMISSAO: TStringField;
    QryGridNUMDOCUMENTO: TStringField;
    QryGridEMAILFUNCEF: TStringField;
    QryGridINSCRICAONUMERO: TStringField;
    QryGridIDCONTRIBUICAO: TFloatField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    Procedure GeraArquivo(sNomeArquivo:String);
    procedure btnGerarClick(Sender: TObject);
    procedure QryGridAfterScroll(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkSelClick(Sender: TObject);
    procedure QryGridSELChange(Sender: TField);
    procedure QryGridAfterPost(DataSet: TDataSet);
  private
    { Private declarations }


  public
    // Felipe A. Santos SOL 180408 KINTANA 1698323
    bEditar : boolean;

    procedure CamposGridReadOnly(ReadOnly : boolean);
    function HabilitarBotaoExcluir : boolean;
    // Felipe A. Santos SOL 180408 KINTANA 1698323 - fim
  end;

var
  frmInscricaoParticipanteLote: TfrmInscricaoParticipanteLote;

implementation
uses FInscBuscaParticipLote,DBaseDados,uSistema,uMensErro,uFuncoesUteis;

{$R *.DFM}

procedure TfrmInscricaoParticipanteLote.sbtnInserirClick(Sender: TObject);
begin
  //inherited;

   if not dtmBaseDados.dbBaseDados.InTransaction then begin
     dtmBaseDados.dbBaseDados.StartTransaction;

     //TADEU PASSOS SOL 180408 KINTANA 1698323
     QryGrid.First;
     QryGrid.DisableControls;
     while not QryGrid.Eof do begin
       QryGrid.Delete;
     end;
     QryGrid.EnableControls;
     //TADEU PASSOS SOL 180408 KINTANA 1698323

     //btnGerar.Enabled := False;
   end;

   try
     // Felipe A. Santos SOL 180408 KINTANA 1698323
     if TBitBtn(Sender).Tag = 1 then
        bEditar := True
     else
        bEditar := False;

     // Felipe A. Santos SOL 180408 KINTANA 1698323 - fim

     Application.CreateForm(TfrmInscBuscaParticipLote,FrmInscBuscaParticipLote);
     frmInscricaoParticipanteLote.Enabled := False;
     FrmInscBuscaParticipLote.ShowModal;
   except
   end;
   sbtnInserir.Down  := False;
   sbtnProcurar.Down := False;
end;

procedure TfrmInscricaoParticipanteLote.bbtnConfirmarClick(Sender: TObject);
var
  sSql : String;
begin
  //inherited;

  Try

    if QryGrid.RecordCount > 0 then begin
      QryGrid.First;
      QryGrid.DisableControls;
     while not QryGrid.Eof do begin
       if QryGrid.FieldByName('SEL').asInteger = 1 then     //William Santana SOL 180408 KINTANA 1698323
       begin

        {##########################################################################
         #TADEU PASSOS                                                            #
         # Pelos motivos do SOL 180408, todo o bloco abaixo estava em             #
         # fInscBuscaParticipLote e foi movido para este form. Portanto os        #
         # comentários de alterações fInscBuscaParticipLote então no bloco abaixo #
         ##########################################################################}

         if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        if QryGrid.FieldByName('POSSUIPLANOATIVO').AsInteger = 1 then begin
          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(' update PARTPREVPLAN set PARTPREVPLAN.FLGDESATIVADO  = 1 ');
          QryAux.SQL.Add(' , DATACANCELAMENTO =  ' + QuotedStr(FormatDateTime('dd/mm/yyyy',(StrToDate(QryGrid.FieldByName('DATAINSCRICAO').AsString) - 1))));
          QryAux.SQL.Add(' , DATAOPCAOIR = ' + QuotedStr(QryGrid.FieldByName('DATAOPCAOIR').AsString)); //TADEU PASSOS SOL 180408 KINTANA 1698323
          QryAux.SQL.Add(' WHERE  PARTPREVPLAN.IDPESSOA     = ' + QryGrid.FieldByName('IDPESSOA').AsString);
          QryAux.SQL.Add(' AND    PARTPREVPLAN.IDPLANOPREV  <> ' + QryGrid.FieldByName('PLANOPREV').AsString);
          qryAux.ExecSQL;
        end;

        //BRUNO AZEVEDO SOL 147489 Kintana 1023626
        if QryGrid.FieldByName('NOVAMATRICULA').AsInteger = 1 then begin
          //PESSOA
          sSQL := '';
          sSQL := 'insert into PESSOA ' +
                  '(IDPESSOA, NOME) ' +
                  'values (' +
                  QryGrid.FieldByName('IDPESSOA').AsString + ',' +
                  QuotedStr(QryGrid.FieldByName('NOME').AsString) + ')';

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.ExecSQL;

          //ELEGIVEL
          sSQL := '';
          sSQL := 'insert into "ELEGIVEL" ' +
                  '(IDPESSOA) ' +
                  'values (' +
                  QryGrid.FieldByName('IDPESSOA').AsString + ')';

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.ExecSQL;

          //PESSOA FISICA
          sSQL := '';
          sSQL := 'insert into PESSOAFISICA ' +
                  '(IDPESSOA, EMAILFUNCEF) ' +  // TADEU PASSOS , inclui o campo EMAILFUNCEF
                  'values (' +
                  QryGrid.FieldByName('IDPESSOA').AsString + ',' + QuotedStr(QryGrid.FieldByName('EMAILFUNCEF').AsString) + ')';

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.ExecSQL;

          //ELEGPATRO
          sSQL := '';
          sSQL := 'insert into ELEGPATRO ' +        //BRUNO AZEVEDO SOL 163405 KINTANA 1438825
                  '(IDPESSOA, IDPESSJUR, MATRICULA, PARTICIPPREVID) ' +
                  'values (' +
                  QryGrid.FieldByName('IDPESSOA').AsString  + ' , ' +
                  QryGrid.FieldByName('IDPESSJUR').AsString + ' , ' +
                  QuotedStr(QryGrid.FieldByName('MATRICULA').AsString) + ', 1 )';

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.ExecSQL;

          //DEPENDENTE
          sSQL := '';
          sSQL := 'insert into DEPENDENTE ' +
                  '(IDPESSOA) ' +
                  'values (' +
                  QryGrid.FieldByName('IDPESSOA').AsString + ')';

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.ExecSQL;

          //DEPENTIT
          sSQL := '';
          sSQL := 'insert into DEPENTIT ' +
                  '(IDTITULAR, IDPESSOA, MATRICULA, IDDEPENDENCIA) ' +
                  'values (' +
                  QryGrid.FieldByName('IDPESSOA').AsString + ',' +
                  QryGrid.FieldByName('IDPESSOA').AsString + ',' +
                  QuotedStr(QryGrid.FieldByName('MATRICULA').AsString) + ',' +
                  QuotedStr('PRP') + ')';

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.ExecSQL;
        end;
        //BRUNO AZEVEDO SOL 147489 Kintana 1023626

        //BRUNO AZEVEDO SOL 163405 KINTANA 1438825
        sSQL := '';
        sSQL := 'UPDATE ELEGPATRO SET PARTICIPPREVID = 1' +
                ' WHERE IDPESSOA  = ' + QryGrid.FieldByName('IDPESSOA').AsString +
                '   AND IDPESSJUR = ' +  QryGrid.FieldByName('IDPESSJUR').AsString;
        //BRUNO AZEVEDO SOL 163405 KINTANA 1438825

        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add(sSQL);
        QryAux.ExecSQL;

        //TADEU PASSOS SOL 180408 KINTANA 1698323
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT NUMDOCUMENTO ' +
                       '  FROM DOCPESSOA    ' +
                       ' WHERE IDDOCUMENTO = 43 ' +
                       '   AND IDPESSOA = ' + QryGrid.FieldByName('IDPESSOA').AsString);
        QryAux.Open;

        sSQL := '';
        if QryAux.IsEmpty then begin
          sSql :=
          'INSERT INTO DOCPESSOA (IDPESSOA,IDDOCUMENTO,DATAEMISSAO,NUMDOCUMENTO) ' +
          'VALUES (' + QryGrid.FieldByName('IDPESSOA').AsString + ',43,' + QuotedStr(QryGrid.FieldByName('DATAEMISSAO').AsString) +
                   ' , ' + QuotedStr(QryGrid.FieldByName('NUMDOCUMENTO').AsString) + ')';
        end
        else begin
          sSQL :=
          'UPDATE DOCPESSOA SET  ' +
          '       DATAEMISSAO  = ' + QuotedStr(QryGrid.FieldByName('DATAEMISSAO').AsString)  +
          '     , NUMDOCUMENTO = ' + QuotedStr(QryGrid.FieldByName('NUMDOCUMENTO').AsString) +
          ' WHERE IDDOCUMENTO  = 43 ' +
          '   AND IDPESSOA     = ' + QryGrid.FieldByName('IDPESSOA').AsString;
        end;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(sSql);
        QryAux.ExecSQL;

        // Atualiza E-mail
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('UPDATE PESSOAFISICA SET ' +
                       '       EMAILFUNCEF = ' + QuotedStr(QryGrid.FieldByName('EMAILFUNCEF').AsString) +
                       ' WHERE IDPESSOA    = ' + QryGrid.FieldByName('IDPESSOA').AsString);
        QryAux.ExecSQL;

        // Verifica se já existe
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT IDPESSOA FROM PARTPREVPLAN '                                +
                       ' WHERE IDPESSJUR   = ' + QryGrid.FieldByName('IDPESSJUR').AsString +
                       '   AND IDPLANOPREV = ' + QryGrid.FieldByName('PLANOPREV').AsString +
                       '   AND IDPESSOA    = ' + QryGrid.FieldByName('IDPESSOA').AsString  +
                       '   AND SEQPROPOSTA = 1');
        QryAux.Open;
        //TADEU PASSOS SOL 180408 KINTANA 1698323

        sSQL :='';
        if QryAux.IsEmpty then begin  //TADEU PASSOS SOL 180408 KINTANA 1698323
          //////////Inscreve Participante
          sSQL :=
          'INSERT INTO PARTPREVPLAN'+
          '          (IDPESSJUR,IDPLANOPREV,IDPESSOA,SEQPROPOSTA,IDSITPART,'+
          '          IDSITPLANOPREV,INSCRICAONUMERO,INSCRICAODATA,INSCRICAOTIPO,'+
          '          SALINSCRICAO,SALPARTICIPACAO,SALMANTIDO,SALVINCULADO,VALORCALCINSS,'+
          '          FLGDEVEEMPRESTIMO,FLGDEVEASSISTENC,FLGDEVEPREVIDENC,VALORINFINSS,'+
          '          SALAUXDOENCA,DATAINICIOSITTEMP,DATAFIMSITTEMP,DATAINICIOMANUT,'+
          '          REQUERIMENTODATA,DTINICIOINSC,FLGFITESPECIAL,FLGDESATIVADO,'+
          '          PARTPREVPLAN.TIPOOPCAOIR, PARTPREVPLAN.DATAOPCAOIR,'+
          '          TRGDTINCLUSAO,TRGUSERINCLUSAO,FLGINSCRICAOLOTE) '+
          '          VALUES (                     '+
          '          ' + QryGrid.FieldByName('IDPESSJUR').AsString + ' , ' +
          '          ' + QryGrid.FieldByName('PLANOPREV').AsString + ' , ' +
          '          ' + QryGrid.FieldByName('IDPESSOA').AsString  + ' , ' +
          '          1,                           '+
          '          1,                           '+
          '          1,                           '+
          '          ' + QryGrid.FieldByName('MATRICULA').AsString + ' , ' +
          '          ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
          '          NULL,                        '+
          '          0,                           '+
          '          0,                           '+
          '          0,                           '+
          '          0,                           '+
          '          0,                           '+
          '          0,                           '+
          '          0,                           '+
          '          0,                           '+
          '          0,                           '+
          '          0,                           '+
          '          NULL,                        '+
          '          NULL,                        '+
          '          NULL,                        '+
          '          NULL,                        '+
          '          ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
          '          0,                           '+
          '          0 ,                          '+
          '          ' + QryGrid.FieldByName('OPCAOIR').AsString + ' , ' +
          '          ' + QuotedStr(QryGrid.FieldByName('DATAOPCAOIR').AsString) + ' , ' +  //TADEU PASSOS SOL 180408 KINTANA 1698323
          '          SYSDATE,                     '+
          '          USER,                        '+
          '          1                        '+
          '          )';
        end
        else begin
         //TADEU PASSOS SOL 180408 KINTANA 1698323
         sSQL :=
         'UPDATE PARTPREVPLAN SET  ' +
         '       INSCRICAONUMERO = ' + QryGrid.FieldByName('MATRICULA').AsString                +
         '    ,  INSCRICAODATA   = ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) +
         '    ,  DTINICIOINSC    = ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) +
         '    ,  TIPOOPCAOIR     = ' + QryGrid.FieldByName('OPCAOIR').AsString                  +
         '    ,  DATAOPCAOIR     = ' + QuotedStr(QryGrid.FieldByName('DATAOPCAOIR').AsString)   +
         ' WHERE IDPESSJUR       = ' + QryGrid.FieldByName('IDPESSJUR').AsString                +
         '   AND IDPLANOPREV     = ' + QryGrid.FieldByName('PLANOPREV').AsString                +
         '   AND IDPESSOA        = ' + QryGrid.FieldByName('IDPESSOA').AsString                 +
         '   AND SEQPROPOSTA     = 1';
         //TADEU PASSOS SOL 180408 KINTANA 1698323
        end;

        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add(sSQL);
        QryAux.ExecSQL;

        //TADEU PASSOS SOL 180408 KINTANA 1698323
        //QryGrid.Edit;         // Felipe A. Santos  OL 180408 KINTANA 1698323
        //QryGrid.FieldByName('INSCRICAONUMERO').AsString := QryGrid.FieldByName('MATRICULA').AsString; // Felipe A. Santos OL 180408 KINTANA 1698323
        //QryGrid.Post; // Felipe A. Santos OL 180408 KINTANA 1698323
        //TADEU PASSOS SOL 180408 KINTANA 1698323

        // Willamy  Henrique SOL  - 238766 - Inicio
        // Verifica se já existe
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT IDPESSOA, IDEVENTOSPREV FROM EVENTOSPREV '                                +
                       ' WHERE IDPESSJUR   = ' + QryGrid.FieldByName('IDPESSJUR').AsString +
                       '   AND IDPLANOPREV = ' + QryGrid.FieldByName('PLANOPREV').AsString +
                       '   AND IDPESSOA    = ' + QryGrid.FieldByName('IDPESSOA').AsString  +
                       '   AND IDEVENTOGERADOR = 1 ' + // evento de inscrição do participante
                       '   AND SEQPROPOSTA = 1');
        QryAux.Open;
       

         sSQL:='';

        if (QryAux.IsEmpty) then
        begin
           sSQL:=
          'INSERT INTO EVENTOSPREV EV '+
          '(ideventosprev, idsitplanoatual, idpessoa, idsitfuncatual,'+
          'ideventogerador, idpessjur, idsitpartatual, idplanoprev, idsitplanonovo,'+
          'idsitpartnovo, dataregistro, dataevento, flgefetivado, dataefetivado, idsitfuncnovo,'+
          'seqproposta, trgdtinclusao, trguserinclusao, inscricaonumero, datarequerimento, matricula)'+
          'VALUES(                    '+
          'SEQEVENTOSPREV.NEXTVAL,    '+
          '1,                         '+
          '' + QryGrid.FieldByName('IDPESSOA').AsString + ' , ' +
          '1,                         '+
          '1,                         '+
          '' + QryGrid.FieldByName('IDPESSJUR').AsString + ' , ' +
          '1,                         '+
          '' + QryGrid.FieldByName('PLANOPREV').AsString + ' , ' +
          '1,                         '+
          '1,                         '+
          'SYSDATE,                   '+
          '' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
          '1,                         '+
          '' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
          '1,                         '+
          '1,                         '+
          'SYSDATE,                   '+
          'USER,                      '+
          '' + QryGrid.FieldByName('MATRICULA').AsString + ' , ' +
          '' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
          '' + QryGrid.FieldByName('MATRICULA').AsString + ' ' +
          ')                         ';
        end
        else
        begin
          sSQL:= 'UPDATE EVENTOSPREV SET ' +
                 ' idsitplanoatual = 1, '  +
                 ' idpessoa =       '  + QryGrid.FieldByName('IDPESSOA').AsString + ' , ' +
                 ' idsitfuncatual = 1,' +
                 ' ideventogerador = 1, '   +
                 ' idpessjur = ' +  QryGrid.FieldByName('IDPESSJUR').AsString + ' , ' +
                 ' idsitpartatual =  1, ' +
                 ' idplanoprev = ' + QryGrid.FieldByName('PLANOPREV').AsString + ' , ' +
                 ' idsitplanonovo = 1,  ' +
                 ' idsitpartnovo = 1,   ' +
                 ' dataregistro =  SYSDATE,                   '+
                 ' dataevento =  ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
                 ' flgefetivado = 1,    ' +
                 ' dataefetivado =  ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
                 ' idsitfuncnovo = 1,   ' +
                 ' seqproposta = 1,     ' +
                 ' inscricaonumero = ' + QryGrid.FieldByName('MATRICULA').AsString + ' , ' +
                 ' datarequerimento = ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
                 ' matricula = '  + QryGrid.FieldByName('MATRICULA').AsString + ' ' +
                 ' WHERE IDPESSJUR   = ' + QryGrid.FieldByName('IDPESSJUR').AsString +
                       '   AND IDPLANOPREV = ' + QryGrid.FieldByName('PLANOPREV').AsString +
                       '   AND IDPESSOA    = ' + QryGrid.FieldByName('IDPESSOA').AsString  +
                       '   AND IDEVENTOGERADOR = 1 ' + // evento de inscrição do participante
                       '   AND SEQPROPOSTA = 1';
        end;
        //willamy Henrique SOL  - 238766 - Fim
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add(sSQL);
        QryAux.ExecSQL;

        sSQL :='';
        if QryGrid.FieldByName('IDCONTRIBUICAO').AsString = '' then begin  //TADEU PASSOS SOL 180408 KINTANA 1698323
          sSQL :=
          'INSERT INTO CONTRIBPREVPARTP CP '+
          '(CP.IDPESSJUR, CP.IDTPPERIODICIDADE, CP.IDPESSOA, CP.IDPLANOPREV,'+
          'CP.SEQPROPOSTA,  CP.IDCONTRIBUICAO, CP.FLGCOBRA, CP.FLGDESCFOLHA,'+
          'CP.FLGRETROATIVO , CP.DATAINICIO, CP.FLGRECALCULA,'+
          'CP.IDHISTPROPOSTA, CP.ULTMESPREPARO, CP.TRGDTINCLUSAO, CP.TRGUSERINCLUSAO,'+
          'CP.VALORBASE1,'+
          'CP.IDPLANPREVCONTAB)'+ //Helio - SOL Nº 253577/18209 PPM Nº 1345077
          'VALUES'+
          '(      '+
          QryGrid.FieldByName('IDPESSJUR').AsString + ' , ' +
          '1,                         '+
          QryGrid.FieldByName('IDPESSOA').AsString  + ' , ' +
          QryGrid.FieldByName('PLANOPREV').AsString + ' , ' +
          '1,                         '+
          '1,                         '+
          '1,                         '+
          '1,                         '+
          '1,                         '+
          QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
          '1,                         '+
          '0,                         '+
          ' ''0000/00'' ,             '+
          'sysdate,                   '+
          'USER,                      '+
          StringReplace(QryGrid.FieldByName('PERCENTUAL').AsString,',','.',[rfReplaceall]) +
          ', ' + QryGrid.FieldByName('PLANOPREV').AsString + ')'; //Helio - SOL Nº 253577/18209 PPM Nº 1345077

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.ExecSQL;

          sSQL :='';
          sSQL :=
          'INSERT INTO CONTRIBPREVPARTP CP '+
          '(CP.IDPESSJUR, CP.IDTPPERIODICIDADE, CP.IDPESSOA, CP.IDPLANOPREV,'+
          'CP.SEQPROPOSTA,  CP.IDCONTRIBUICAO, CP.FLGCOBRA, CP.FLGDESCFOLHA,'+
          'CP.FLGRETROATIVO , CP.DATAINICIO, CP.FLGRECALCULA,'+
          'CP.IDHISTPROPOSTA, CP.ULTMESPREPARO, CP.TRGDTINCLUSAO, CP.TRGUSERINCLUSAO,'+
          'CP.VALORBASE1,'+
          'CP.IDPLANPREVCONTAB)'+ //Helio - SOL Nº 253577/18209 PPM Nº 1345077
          'VALUES'+
          '(      '+
          QryGrid.FieldByName('IDPESSJUR').AsString + ' , ' +
          '1,                         '+
          QryGrid.FieldByName('IDPESSOA').AsString  + ' , ' +
          QryGrid.FieldByName('PLANOPREV').AsString + ' , ' +
          '1,                         '+
          '21,                        '+
          '1,                         '+
          '1,                         '+
          '1,                         '+
          QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) + ' , ' +
          '1,                         '+
          '0,                         '+
          ' ''0000/00'' ,             '+
          'sysdate,                   '+
          'USER,                      '+
          StringReplace(QryGrid.FieldByName('PERCENTUAL').AsString,',','.',[rfReplaceall]) +
          ', ' + QryGrid.FieldByName('PLANOPREV').AsString + ')'; //Helio - SOL Nº 253577/18209 PPM Nº 1345077

          QryAux.Close;
          QryAux.SQL.Clear;
          QryAux.SQL.Add(sSQL);
          QryAux.ExecSQL;
        end
        else begin
         //TADEU PASSOS SOL 180408 KINTANA 1698323
         sSQL :=
         'UPDATE CONTRIBPREVPARTP SET ' +
         '       DATAINICIO      = ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) +
         '    ,  VALORBASE1      = ' + StringReplace(QryGrid.FieldByName('PERCENTUAL').AsString,',','.',[rfReplaceall]) +
         ' WHERE IDPESSJUR       = ' + QryGrid.FieldByName('IDPESSJUR').AsString                +
         '   AND IDPLANOPREV     = ' + QryGrid.FieldByName('PLANOPREV').AsString                +
         '   AND IDPESSOA        = ' + QryGrid.FieldByName('IDPESSOA').AsString                 +
         '   AND IDCONTRIBUICAO  = 1';

         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Add(sSQL);
         QryAux.ExecSQL;

         sSQL :=
         'UPDATE CONTRIBPREVPARTP SET ' +
         '       DATAINICIO      = ' + QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) +
         '    ,  VALORBASE1      = ' + StringReplace(QryGrid.FieldByName('PERCENTUAL').AsString,',','.',[rfReplaceall]) +
         ' WHERE IDPESSJUR       = ' + QryGrid.FieldByName('IDPESSJUR').AsString                +
         '   AND IDPLANOPREV     = ' + QryGrid.FieldByName('PLANOPREV').AsString                +
         '   AND IDPESSOA        = ' + QryGrid.FieldByName('IDPESSOA').AsString                 +
         '   AND IDCONTRIBUICAO  = 21';

         QryAux.Close;
         QryAux.SQL.Clear;
         QryAux.SQL.Add(sSQL);
         QryAux.ExecSQL;
         //TADEU PASSOS SOL 180408 KINTANA 1698323
        end;

        sSQL :='';
        sSQL :=
        ' INSERT INTO RESERVAPART'+
        ' (IDTIPORESERVA, IDPLANOPREV, IDPESSOA , IDPESSJUR, DATAREFERENCIASA,'+
        ' SEQPROPOSTA, VALORRESERVA, FLGATIVO, FLGINCONSISTENCIA, IDPARTICIPANTE, trgdtinclusao, trguserinclusao)'+
        ' SELECT DISTINCT RP.IDTIPORESERVA , RP.IDPLANOPREV, P.IDPESSOA, P.IDPESSJUR,'+
        QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString) +
        ' , 1, 0, 1, 0,P.IDPESSOA AS IDPARTICIPANTE,' +
        ' SYSDATE,'+
        ' USER'+
        ' FROM PARTPREVPLAN P, RESERVAXPLANO RP, RESERVAXCONTRIB RC, CONTRIBPREVPARTP CP'+
        ' WHERE P.IDPESSJUR = CP.IDPESSJUR AND'+
        ' P.IDPLANOPREV = CP.IDPLANOPREV AND'+
        ' P.IDPLANOPREV = ' + QryGrid.FieldByName('PLANOPREV').AsString + ' AND' +
        ' P.IDPESSJUR = ' + QryGrid.FieldByName('IDPESSJUR').AsString + ' AND' +
        ' P.IDPESSOA = CP.IDPESSOA AND'+
        ' RP.IDPLANOPREV = P.IDPLANOPREV AND'+
        ' RP.ANALITICOSINTETI = ''A'' AND'+
        ' NVL(RP.FLGCOLETIVA,0) = 0 AND'+
        ' RC.IDPLANOPREV = RP.IDPLANOPREV AND'+
        ' RC.IDTIPORESERVA = RP.IDTIPORESERVA AND'+
        ' CP.IDCONTRIBUICAO IN (1,21) AND'+
        ' CP.IDCONTRIBUICAO = RC.IDCONTRIBUICAO    AND'+
        ' P.IDPESSOA   = ' + QryGrid.FieldByName('IDPESSOA').AsString +
        ' AND NOT EXISTS'+
        ' (SELECT 1'+
        ' FROM RESERVAPART R'+
        ' WHERE'+
        ' R.IDPESSJUR = P.IDPESSJUR AND'+
        ' R.IDPLANOPREV = P.IDPLANOPREV AND'+
        ' R.IDPESSOA = P.IDPESSOA AND'+
        ' R.IDTIPORESERVA = RP.IDTIPORESERVA AND'+
        ' R.IDPLANOPREV = RP.IDPLANOPREV )'+
        ' ORDER BY P.IDPESSOA';

        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add(sSQL);
        QryAux.ExecSQL;


        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add(' INSERT INTO HSTPERCONTRIBPREV ');
        QryAux.SQL.Add(' (IDHSTPERCONTRIBPREV,');
        QryAux.SQL.Add(' IDPESSJUR,');
        QryAux.SQL.Add(' IDPESSOA,');
        QryAux.SQL.Add(' IDPLANOPREV,');
        QryAux.SQL.Add(' IDCONTRIBUICAO,');
        QryAux.SQL.Add(' DTINICIO,');
        QryAux.SQL.Add(' DTFIM,');
        QryAux.SQL.Add(' PERCENTUAL,');
        QryAux.SQL.Add(' SEQPROPOSTA )VALUES( ');

        QryAux.SQL.Add('SEQHSTPERCONTRIBPREV.NEXTVAL,');
        QryAux.SQL.Add(Trim(QryGrid.FieldByName('IDPESSJUR').AsString) + ' , ');
        QryAux.SQL.Add(Trim(QryGrid.FieldByName('IDPESSOA').AsString)  + ' , ');
        QryAux.SQL.Add(Trim(QryGrid.FieldByName('PLANOPREV').AsString) + ' , ');
        QryAux.SQL.Add(Trim('1')  +',');
        QryAux.SQL.Add(Trim(QuotedStr(QryGrid.FieldByName('DATAINSCRICAO').AsString)) + ' , ');
       // QryAux.SQL.Add('(SELECT TO_DATE(''01/''||TO_CHAR(TO_DATE('+QuotedStr(dtInscricao.Text)+',''DD/MM/YYYY''),''MM/YYYY''),''DD/MM/YYYY'')-1 FROM DUAL),');
        QryAux.SQL.Add('NULL,');
        QryAux.SQL.Add(Trim(StringReplace(QryGrid.FieldByName('PERCENTUAL').AsString,',','.',[rfReplaceall])) + ' , ');
        QryAux.SQL.Add('1)');
        QryAux.ExecSQL;
        {##########################################################################
         #TADEU PASSOS                                                            #
         ##########################################################################}

        // Peterson Victor SIG28170 - inicio
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('INSERT INTO HISTOPIR ');
        QryAux.SQL.Add('(IDHISTOPIR,IDPESSOA, IDPLANPREV, TIPOOPCAOIR, DTINICIO, DTFIM)VALUES');
        QryAux.SQL.Add('(SEQHISTOPIR.NEXTVAL , ' + Trim(QryGrid.FieldByName('IDPESSOA').AsString) + ' , ' + Trim(QryGrid.FieldByName('PLANOPREV').AsString) + ' , ' );
        QryAux.SQL.Add(  QryGrid.FieldByName('OPCAOIR').AsString + ' , ' + QuotedStr(QryGrid.FieldByName('DATAOPCAOIR').AsString) + ' , ' + 'NULL)');
        QryAux.ExecSQL;
        // Peterson Victor SIG28170 - fim


       end;
        QryGrid.Next;
     end;
      //William Santana SOL 180408 KINTANA 1698323
      {
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit; }

      if dtmBaseDados.dbBaseDados.InTransaction then
      begin
        dtmBaseDados.dbBaseDados.Commit;
        MsgDlg('Cadastro atualizado com sucesso','Confirmação',mtConfirmation,[mbOK],0);
      end;
      //END - William Santana SOL 180408 KINTANA 1698323

      QryGrid.EnableControls;
      QryGrid.First;

      btnExcluirClick(sender);  //William Santana SOL 180408 KINTANA 1698323  {para remover os selecionados após o fim do cadastro}

      bbtnConfirmar.Enabled := False;
      //btnGerar.Enabled      := True;
    end;
  Except
   if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;
  end;
end;

procedure TfrmInscricaoParticipanteLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Rollback;

end;

procedure TfrmInscricaoParticipanteLote.bbtnCancelarClick(Sender: TObject);
begin
  //inherited;

  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.Rollback;

end;

procedure TfrmInscricaoParticipanteLote.FormShow(Sender: TObject);
begin
  inherited;

  QryGrid.Close;
  QryGrid.Open;
  QryGrid.Delete;
  pnlFundo.Enabled := true;

  CamposGridReadOnly(True); // Felipe A. Santos SOL 180408 KINTANA 1698323
end;

procedure TfrmInscricaoParticipanteLote.btnLimparClick(Sender: TObject);
begin
  inherited;

  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.Rollback;

  QryGrid.Close;
  QryGrid.Open;
  QryGrid.Delete;

end;

procedure TfrmInscricaoParticipanteLote.GeraArquivo(sNomeArquivo: String);
var F : TextFile;
var sLinha : String;
sPercent, sPercentual, sTipoArquivo,sDataCaixa  : String;
begin

  if QryRelatorio.Active then begin
    QryRelatorio.First;
    sLinha :='';

    AssignFile(F, sistema.RetornaCaminhoArquivos(sistema.IdEmpresa)+'\'+sNomeArquivo+'.TXT');
    ReWrite(F);

    //sDataCaixa := DateTostr(BuscaDataFuncef());//FuncoesUteis //SOL 147055 Kintana 1010747 comentado a função antiga
    //sDataCaixa := DateTostr(F_Diasuteis());//FuncoesUteis       //SOL 147055 Kintana 1010747 incluido a nova função


    While not QryRelatorio.Eof do begin
      if QryRelatorio.FieldByname('IDPESSJUR').asInteger = 91008 then begin
        if QryRelatorio.FieldByname('IDPLANOPREV').asInteger = 66 then begin
          sTipoArquivo := '13';
        end else if QryRelatorio.FieldByname('IDPLANOPREV').asInteger = 74 then begin
          sTipoArquivo := '15';
        end;

        sPercent := StringReplace(FloatTostr(QryRelatorio.fieldByname('CONTRIBUICAO').asFloat*100),',','',[rfReplaceall]);
        sDataCaixa := QryRelatorio.FieldByName('DATAINSCRICAO').AsString;
//        if length(trim(sPercent)) = 1 then begin
//          sPercentual := '00'+trim(sPercent)+'0';
//        end else if length(trim(sPercent)) = 2 then begin
//          sPercentual := '0'+trim(sPercent)+'0';
//        end else if length(trim(sPercent)) = 3 then begin
//          sPercentual := '0'+trim(sPercent);
//        end else begin
//          sPercentual := sPercent;
//        end;

        sPercentual := CompletaString(sPercent,'0',5,false); //Fernando Santana SOL 145293 Kintana 970786

        sLinha := Trim(copy(QryRelatorio.FieldByname('MATRICULA').asString,1,Length(QryRelatorio.FieldByname('MATRICULA').asString)-1))+''+
                  StringReplace(sDataCaixa,'/','.',[rfReplaceall])+''+
                  sPercentual+''+
                  sTipoArquivo;

        WriteLn(F, sLinha);

      end;
      QryRelatorio.Next;

    end;

    CloseFile(F);
  end;

end;

procedure TfrmInscricaoParticipanteLote.btnGerarClick(Sender: TObject);
var sNomeArquivo, sDataTitulo : String;
begin
  inherited;

  //ppLblDataCaixa.Caption := DateTostr((BuscaDataFuncef));//FuncoesUteis   //SOL 147055 Kintana 1010747 comentado a função antiga
  //ppLblDataCaixa.Caption := DateTostr((F_Diasuteis));//FuncoesUteis   //SOL 147055 Kintana 1010747 incluido a nova função

  sDataTitulo  := DateToStr(Date());   //Fanuel Junior SOL154361  Kintana1188271
  //sNomeArquivo :='Inscrições Mês'+' '+Copy(ppLblDataCaixa.Caption,7,4)+Copy(ppLblDataCaixa.Caption,4,2);  //Fanuel Junior SOL154361   Kintana1188271
  sNomeArquivo :='Inscrições Mês'+' '+Copy(sDataTitulo,7,4)+Copy(sDataTitulo,4,2);  //Fanuel Junior SOL154361   Kintana1188271

  if (chkRelatorio.Checked) or (chkPdf.checked) or (chkXls.Checked) or (chkTxt.Checked) then begin
    if (trim(dtInicio.Text) ='') or (trim(dtFim.Text) ='') then begin
      MsgDlg('Preencha as Datas ','Informação', mtConfirmation, [mbOk], 0);
      dtInicio.SetFocus;
      Exit;
    end;

    if (dtInicio.Date > dtFim.Date) then begin
      //William Santana SOL 180408 KIN 1698323
      //MsgDlg('Data inicial não pode ser menor que a final ','Informação', mtConfirmation, [mbOk], 0);
      MsgDlg('Data inicial não pode ser maior que a final ','Informação', mtConfirmation, [mbOk], 0);
      //END - William Santana SOL 180408 KIN 1698323
      exit;
    end;

    QryRelatorio.Close;
    QryRelatorio.ParamByname('PDTINICIO').asDateTime := dtInicio.Date;
    QryRelatorio.ParamByname('PDATAFIM').asDateTime    := dtFim.Date;
    QryRelatorio.Open;
    QryRelatorio.first;

    if QryRelatorio.IsEmpty then begin
      MsgDlg('Nenhum participante encontrado.', 'Informação', mtConfirmation, [mbOk], 0);
      exit;
    end;


  end;

  if chkRelatorio.Checked then begin
    ppReport.DeviceType       := 'Screen';
    ppReport.AllowPrintToFile := False;
    ppReport.ShowPrintDialog  := True;
    ppReport.TextFileName     := '';
    ppReport.Print;
  end;

  if (chkPdf.checked) then begin
    ppReport.DeviceType       := 'PDFFile';
    ppReport.AllowPrintToFile := True;
    ppReport.ShowPrintDialog  := False;
    ppReport.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+pChar(sNomeArquivo)+'.PDF';
    ppReport.Print;
  end;

  if (chkXls.Checked) then begin
    ppReport.DeviceType       := 'ExcelFile';
    ppReport.AllowPrintToFile := True;
    ppReport.ShowPrintDialog  := False;
    ppReport.TextFileName     := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\'+pChar(sNomeArquivo)+'.XLS';
    ppReport.Print;
  end;

  if chktxt.Checked then begin
    GeraArquivo(sNomeArquivo);
  end;

  if (chkPdf.checked) or (chkTxt.checked) or (chkXLS.checked)then begin
    MsgDlg('Arquivo(s) gerado(s) em '+sistema.RetornaCaminhoArquivos(sistema.IdEmpresa), 'Informação', mtConfirmation, [mbOk], 0);
  end;

  bbtnConfirmar.Enabled := False;
  btnExcluir.Enabled := False;

end;

procedure TfrmInscricaoParticipanteLote.QryGridAfterScroll(
  DataSet: TDataSet);
begin
  inherited;

  if QryGrid.Active then begin
    bbtnConfirmar.Enabled := not(QryGrid.IsEmpty);
    bbtnCancelar.Enabled  := not(QryGrid.IsEmpty);
    //btnGerar.Visible      := not(QryGrid.IsEmpty);
    //btnExcluir.Enabled    := not(QryGrid.IsEmpty);
  end;

end;

procedure TfrmInscricaoParticipanteLote.btnExcluirClick(Sender: TObject);
begin
  inherited;

  if QryGrid.Active then begin
    if not QryGrid.IsEmpty then begin

      //TADEU PASSOS SOL 180408 KINTANA 1698323
      {QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.ADD('DELETE FROM RESERVAPART');
      QryAux.SQL.ADD(' WHERE IDPESSJUR  ='+ QryGrid.FieldByname('IDPESSJUR').asString);
      QryAux.SQL.ADD('  AND   IDPESSOA  ='+ QryGrid.FieldByname('IDPESSOA').asString);
      QryAux.SQL.ADD('  AND IDPLANOPREV ='+ QryGrid.FieldByname('PLANOPREV').asString);
      QryAux.SQL.ADD('  AND TRUNC(TRGDTINCLUSAO) = TRUNC(SYSDATE)');
      QryAux.ExecSQL;

      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.ADD('DELETE FROM CONTRIBPREVPARTP');
      QryAux.SQL.ADD(' WHERE IDPESSJUR  ='+ QryGrid.FieldByname('IDPESSJUR').asString);
      QryAux.SQL.ADD('  AND   IDPESSOA  ='+ QryGrid.FieldByname('IDPESSOA').asString);
      QryAux.SQL.ADD('  AND IDPLANOPREV ='+ QryGrid.FieldByname('PLANOPREV').asString);
      QryAux.SQL.ADD('  AND IDCONTRIBUICAO IN (1,21)');
      QryAux.SQL.ADD('  AND TRUNC(TRGDTINCLUSAO) = TRUNC(SYSDATE)');
      QryAux.ExecSQL;

      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.ADD('DELETE FROM EVENTOSPREV');
      QryAux.SQL.ADD(' WHERE IDPESSJUR  ='+ QryGrid.FieldByname('IDPESSJUR').asString);
      QryAux.SQL.ADD('  AND   IDPESSOA  ='+ QryGrid.FieldByname('IDPESSOA').asString);
      QryAux.SQL.ADD('  AND IDPLANOPREV ='+ QryGrid.FieldByname('PLANOPREV').asString);
      QryAux.SQL.ADD('  AND TRUNC(TRGDTINCLUSAO) = TRUNC(SYSDATE)');
      QryAux.ExecSQL;

      QryAux.Close;
      QryAux.SQL.Clear;
      QryAux.SQL.ADD('DELETE FROM PARTPREVPLAN');
      QryAux.SQL.ADD(' WHERE IDPESSJUR     ='+ QryGrid.FieldByname('IDPESSJUR').asString);
      QryAux.SQL.ADD('  AND IDPESSOA       ='+ QryGrid.FieldByname('IDPESSOA').asString);
      QryAux.SQL.ADD('  AND IDPLANOPREV    ='+ QryGrid.FieldByname('PLANOPREV').asString);
      QryAux.SQL.ADD('  AND IDSITPART      = 1');
      QryAux.SQL.ADD('  AND IDSITPLANOPREV = 1');
      QryAux.SQL.ADD('  AND TRUNC(TRGDTINCLUSAO) = TRUNC(SYSDATE)');
      QryAux.ExecSQL;}
      //TADEU PASSOS SOL 180408 KINTANA 1698323

      while QryGrid.Locate('SEL', 1, []) do QryGrid.Delete;// Felipe A. Santos SOL 180408 KINTANA 1698323
    end;
  end;
  btnExcluir.Enabled := False; // Felipe A. Santos SOL 180408 KINTANA 1698323
end;

procedure TfrmInscricaoParticipanteLote.FormCreate(Sender: TObject);
begin
  inherited;

  dtInicio.Date := Now;
  dtFim.Date    := Now;
end;

procedure TfrmInscricaoParticipanteLote.CamposGridReadOnly(ReadOnly : boolean);
var
   i : integer;
begin
  // Felipe A. Santos SOL 180408 KINTANA 1698323
  for i := 0 to QryGrid.FieldCount - 1 do
  begin
       if QryGrid.Fields[i].FieldName = 'SEL' then
          Continue;

       QryGrid.Fields[i].ReadOnly := ReadOnly;
  end;
  // Felipe A. Santos SOL 180408 KINTANA 1698323- fim
end;

procedure TfrmInscricaoParticipanteLote.chkSelClick(Sender: TObject);
var
   iSel : integer;
   BM : TBookMark;
begin
  inherited;
  // Felipe A. Santos SOL 180408 KINTANA 1698323
  if chkSel.Checked then
     iSel := 1
  else
     iSel := 0;

  BM := QryGrid.GetBookmark;
  QryGrid.DisableControls;
  QryGrid.First;

  while not(QryGrid.Eof) do
  begin
       QryGrid.Edit;
       QryGrid.FieldByName('SEL').AsInteger := iSel;

       QryGrid.Next;
  end;
  QryGrid.GotoBookmark(BM);
  QryGrid.EnableControls;
  // Felipe A. Santos SOL 180408 KINTANA 1698323 - fim
end;

function TfrmInscricaoParticipanteLote.HabilitarBotaoExcluir : boolean;
var
  BM : TBookMark;
begin
  // Felipe A. Santos SOL 180408 KINTANA 1698323
  BM := QryGrid.GetBookmark;
  QryGrid.DisableControls;

  Result := QryGrid.Locate('SEL', 1, []);

  QryGrid.GotoBookmark(BM);
  QryGrid.EnableControls;
  // Felipe A. Santos SOL 180408 KINTANA 1698323 - fim
end;

procedure TfrmInscricaoParticipanteLote.QryGridSELChange(Sender: TField);
begin
  inherited;
  if frmInscBuscaParticipLote.Showing = false then
  btnExcluir.Enabled := HabilitarBotaoExcluir; // Felipe A. Santos SOL 180408 KINTANA 1698323
end;

//William Santana SOL 180408 KINTANA 1698323
procedure TfrmInscricaoParticipanteLote.QryGridAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  btnExcluir.Enabled := HabilitarBotaoExcluir;
end;
//William Santana SOL 180408 KINTANA 1698323
end.
