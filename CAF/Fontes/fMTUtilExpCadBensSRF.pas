// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fMTUtilExpCadBensSRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Halcn6DB, Db, DBTables, Wwquery, BfDialogs,
  BrowseFolder, uProcuraDir, wwdbdatetimepicker, CMDateTimePicker, Gauges,
  uCmSqlParams, DBClient, uCMClientDataSet,
  uCMTypes, uCtrlPadroes, uCtrlParamCAF, IvEMulti;

type
  TfrmMTUtilExpCadBensSRF = class(TfrmOkCancelar)
    pnlStatus: TPanel;
    lblStatus: TLabel;
    pnlprgBar: TPanel;
    prgBar: TGauge;
    Label1: TLabel;
    eDtaInicio: TCMDateTimePicker;
    Label3: TLabel;
    eDtaFim: TCMDateTimePicker;
    edSelPasta: TEdit;
    Label7: TLabel;
    bbtnSelPasta: TBitBtn;
    pDirTrabalho: TProcuraDirDlg;
    cdsCadBens: TCMClientDataSet;
    sqlCadBens: TCMSqlParams;
    BitBtn1: TBitBtn;
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    function CompletaB(sCampo : String; iTam : Integer) : String;
    function CompletaZ(sCampo : String; iTam : Integer) : String;
    function RemCharInvalid(sCampo : String) : String;
  public
    { Public declarations }
  end;

var
  frmMTUtilExpCadBensSRF: TfrmMTUtilExpCadBensSRF;

implementation

{$R *.DFM}

uses uMensErro, uSistema;

procedure TfrmMTUtilExpCadBensSRF.FormCreate(Sender: TObject);
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   if not ParamCAF.CarregaProp(Sistema.IdEmpresa) then
      Raise Exception.Create('Parâmetros do sistema inválidos!');
end;
//========================================================================================
procedure TfrmMTUtilExpCadBensSRF.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   pDirTrabalho.ShowPath := False;
   pDirTrabalho.Caption := 'Pasta de Trabalho';
   pDirTrabalho.Execute;
   edSelPasta.Text := pDirTrabalho.Directory;
end;
//========================================================================================
procedure TfrmMTUtilExpCadBensSRF.bbtnConfirmarClick(Sender: TObject);
var
   sLinha   : String;
   atxtBens : TextFile;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   if edSelPasta.Text = '' then
   begin
      MsgDlg('Selecione a pasta onde será criado o texto!','Erro',mtError,[mbOk],0);
      bbtnSelPasta.SetFocus;
      exit;
   end;
   //-------------------------------------------------------------------------------------
   if eDtaInicio.Text = '' then
   begin
      MsgDlg('Data Início do período não pode estar vazia !','Erro',mtError,[mbOk],0);
      eDtaInicio.SetFocus;
      exit;
   end else
   //-------------------------------------------------------------------------------------
   if eDtaFim.Text = '' then
   begin
      MsgDlg('Data Final do período não pode estar vazia !','Erro',mtError,[mbOk],0);
      eDtaInicio.SetFocus;
      exit;
   end else
      if eDtaInicio.Date > eDtaFim.Date then
      begin
         MsgDlg('Data Final não pode ser anterior a Data Início !','Erro',mtError,[mbOk],0);
         eDtaFim.SetFocus;
         exit;
      end;
   //-------------------------------------------------------------------------------------
   try
      lblStatus.Caption := 'Preparando Dados, Aguarde...';
      prgBar.MaxValue := 1;
      prgBar.Progress := 0;
      pnlStatus.Visible := True;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      sqlCadBens.Prepare;
      sqlCadBens.ParamByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
      sqlCadBens.ParamByName('DATAMOVINI').AsDate     := eDtaInicio.Date;
      sqlCadBens.ParamByName('DATAMOVFIM').AsDate     := eDtaFim.Date;
      sqlCadBens.ParamByName('MOECODIGO').AsFloat     := ParamCAF.MOEDAOFICIAL;
      sqlCadBens.ParamByName('IDTAXADEP').AsFloat     := 1;                        // País
      sqlCadBens.Open;
      //----------------------------------------------------------------------------------
      AssignFile(atxtBens , trim(edSelPasta.Text) + '\SRF-IN86.TXT');
      Rewrite(atxtBens);
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsCadBens.RecordCount;
      while not cdsCadBens.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo de Transferência ...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('PLACA').AsString                           , 20);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('NATUREZA').AsString                        ,  1);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('PLACAPRINCIPAL').AsString                  , 20);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('DESCBEM').AsString                         , 45);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('CONTACUSTO').AsString                      , 28);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('CONTADEPREC').AsString                     , 28);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('DTAINCLUSAO').AsString                     ,  8);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('TIPODOC').AsString                         ,  3);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('COMPLNOTA').AsString                       ,  5);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('IDNOTA').AsString                          , 12);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('VALHISTORICO').AsFloat), 17);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('VALORG').AsFloat)      , 17);
         sLinha := sLinha + CompletaB(cdsCadBens.FieldByName('IDBEM').AsString                           , 12);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('DATAINICIODEP').AsString                   ,  8);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('TAXADEP').AsFloat)     ,  5);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('DEPACUMANT').AsFloat)  , 17);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',cdsCadBens.FieldByName('DEPACUMPER').AsFloat)  , 17);
         sLinha := sLinha + CompletaZ(cdsCadBens.FieldByName('DATABAIXA').AsString                       ,  8);
         Writeln(atxtBens,trim(sLinha));
         //-------------------------------------------------------------------------------
         cdsCadBens.Next;
      end;
      //----------------------------------------------------------------------------------
      CloseFile(atxtBens);
      MsgDlg('Operação Realizada!','Informação',mtInformation,[mbOk],0);
   except
      on E : Exception do
      begin
         CloseFile(atxtBens);
         MsgDlg('Operação não Realizada!' + #13 + #13 +
                'Excessão : ' + E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
function TfrmMTUtilExpCadBensSRF.CompletaB(sCampo : String; iTam : Integer) : String;
var
   sCampoAux : String;

begin
   // Remove os caracteres inválidos
   sCampoAux := copy(RemCharInvalid(sCampo), 1, iTam);
   // Complementa com brancos a direita até que o tamanho do campo esteja preenchido
   while length(sCampoAux) < iTam do
      sCampoAux := sCampoAux + ' ';
   //
   Result := sCampoAux;
end;
//========================================================================================
function TfrmMTUtilExpCadBensSRF.CompletaZ(sCampo : String; iTam : Integer) : String;
var
   sCampoAux : String;

begin
   // Remove os caracteres inválidos
   sCampoAux := RemCharInvalid(sCampo);
   // Complementa com zeros a esquerda até que o tamanho do campo esteja preenchido
   while length(sCampoAux) < iTam do
      sCampoAux := '0' + sCampoAux;
   //
   Result := sCampoAux;
end;
//========================================================================================
function TfrmMTUtilExpCadBensSRF.RemCharInvalid(sCampo : String) : String;
var
   iAux : Integer;
begin
   Result := '';
   for iAux := 1 to length(sCampo) do
   begin
      if not ((sCampo[iAux] = ',') or (sCampo[iAux] = '.') or (sCampo[iAux] = '+') or
              (sCampo[iAux] = '-') or (sCampo[iAux] = '/') or (sCampo[iAux] = #13) or
              (sCampo[iAux] = #10)) then
         Result := Result + sCampo[iAux];
   end;
end;
//========================================================================================
procedure TfrmMTUtilExpCadBensSRF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsCadBens.Close;
   ParamCAF.Free;
end;
//========================================================================================
procedure TfrmMTUtilExpCadBensSRF.BitBtn1Click(Sender: TObject);
var
   sLinha1, sLinha2, sDataMov,
   sBem, sEmpresa, sGrupo,
   sConjunto, sLocalizacao,
   sResponsavel, sConjuntoA,
   sLocalizacaoA, sResponsavelA : String;
   atxtSql1, atxtSql2 : TextFile;
   iSelBaixa : Integer;

begin
   inherited;
   try
      //AssignFile(atxtSql1,'C:\Marquise-PesquisaTermoTransf21.txt');
      AssignFile(atxtSql1,Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\Marquise-PesquisaTermoTransf21.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      Reset(atxtSql1);
      //----------------------------------------------------------------------------------
      //AssignFile(atxtSql2,'C:\Marquise-GeraTermoTransf.sql');
      AssignFile(atxtSql2,Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) +'\Marquise-GeraTermoTransf.sql');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      Rewrite(atxtSql2);
      //----------------------------------------------------------------------------------
      iSelBaixa := 101;
      Readln(atxtSql1,sLinha1);
      repeat
         sDataMov := trim(copy(sLinha1,19,10));
         sLinha2 := ' INSERT INTO SELBAIXA (IDSELBAIXA,IDPESSOA,SBTIPOMOV,SBXTERMO,SBXPROCESSO,SBXDATA,SBXFLGEXECUTADO,SBXDTAEXECUTADO) '+
                    ' VALUES ('+inttostr(iSelBaixa)+', 1, 1, '+inttostr(iSelBaixa)+', ' + #39 + 'TRANSF.2001.06' + #39 + ',' +
                              'TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',strtodate(sDataMov)) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + '), 1,'+
                              'TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',strtodate(sDataMov)) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ') );';
         Writeln(atxtSql2,trim(sLinha2));
         repeat
            sBem          := trim(copy(sLinha1, 1, 7));
            sEmpresa      := trim(copy(sLinha1, 8, 3));
            sGrupo        := trim(copy(sLinha1,32, 3));
            sConjunto     := trim(copy(sLinha1,36, 3));
            sLocalizacao  := trim(copy(sLinha1,40, 3));
            sResponsavel  := trim(copy(sLinha1,44, 5));
            //----------------------------------------------------------------------------
            if trim(copy(sLinha1,50, 3)) <> '' then
               sConjuntoA := trim(copy(sLinha1,50, 3))
            else
               sConjuntoA := sConjunto;
            if trim(copy(sLinha1,53, 4)) <> '' then
               sLocalizacaoA := trim(copy(sLinha1,53, 4))
            else
               sLocalizacaoA := sLocalizacao;
            if trim(copy(sLinha1,58, 5)) <> '' then
               sResponsavelA := trim(copy(sLinha1,58, 5))
            else
               sResponsavelA := sResponsavel;
            //----------------------------------------------------------------------------
            Readln(atxtSql1, sLinha1);
            while (not EOF(atxtSql1)) and (trim(copy(sLinha1, 1, 7)) = sBem) do
            begin
               if trim(copy(sLinha1,50, 3)) <> '' then
                  sConjuntoA := trim(copy(sLinha1,50, 3));
               if trim(copy(sLinha1,53, 4)) <> '' then
                  sLocalizacaoA := trim(copy(sLinha1,53, 4));
               if trim(copy(sLinha1,58, 5)) <> '' then
                  sResponsavelA := trim(copy(sLinha1,58, 5));
               //-------------------------------------------------------------------------
               Readln(atxtSql1,sLinha1);
            end;
            //----------------------------------------------------------------------------
            sLinha2 := 'INSERT INTO SELBAIXABENS (IDSELBAIXA, IDPESSOA, IDBEM, IDGRUPATUAL, IDGRUPO, '+
                                                 'IDCONJATUAL, IDCONJUNTO, IDLOCALATUAL, IDLOCALIZACAO, '+
                                                 'IDRESPATUAL, IDRESPONSAVEL, FLGEXECUTADO) '+
                                         'VALUES ('+inttostr(iSelBaixa)+','+sEmpresa+','+sBem+','+
                                                  sGrupo+','+sGrupo+','+
                                                  sConjuntoA+','+sConjunto+','+
                                                  sLocalizacaoA+','+sLocalizacao+','+
                                                  sResponsavelA+','+sResponsavel+',1);';
            Writeln(atxtSql2,trim(sLinha2));
            //----------------------------------------------------------------------------
         until EOF(atxtSql1) or (trim(copy(sLinha1,19,10)) <> sDataMov);
         iSelBaixa := iSelBaixa + 1;
      until EOF(atxtSql1);
      //----------------------------------------------------------------------------------
      sLinha2 := 'DROP SEQUENCE SEQSELBAIXA;';
      Writeln(atxtSql2,trim(sLinha2));
      sLinha2 := 'CREATE SEQUENCE SEQSELBAIXA NOCACHE START WITH '+inttostr(iSelBaixa)+';';
      Writeln(atxtSql2,trim(sLinha2));
      //----------------------------------------------------------------------------------
      CloseFile(atxtSql1);
      CloseFile(atxtSql2);
      MsgDlg('Operação Realizada!','Informação',mtInformation,[mbOk],0);
   except
      on E : Exception do
      begin
         CloseFile(atxtSql1);
         CloseFile(atxtSql2);
         MsgDlg('Operação não Realizada!' + #13 + #13 +
                'Excessão : ' + E.Message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
end;

end.
