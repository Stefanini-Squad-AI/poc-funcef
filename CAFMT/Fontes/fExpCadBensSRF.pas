unit fExpCadBensSRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Halcn6DB, Db, DBTables, Wwquery, BfDialogs,
  BrowseFolder, uProcuraDir, wwdbdatetimepicker, CMDateTimePicker, Gauges;

type
  TfrmExpCadBensSRF = class(TfrmOkCancelar)
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
    qryCadBens: TwwQuery;
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function CompletaB(sCampo : String; iTam : Integer) : String;
    function CompletaZ(sCampo : String; iTam : Integer) : String;
    function RemCharInvalid(sCampo : String) : String;
  public
    { Public declarations }
  end;

var
  frmExpCadBensSRF: TfrmExpCadBensSRF;

implementation

{$R *.DFM}

uses uMensErro, uSistema;

procedure TfrmExpCadBensSRF.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   pDirTrabalho.ShowPath := False;
   pDirTrabalho.Caption := 'Pasta de Trabalho';
   pDirTrabalho.Execute;
   edSelPasta.Text := pDirTrabalho.Directory;
end;
//========================================================================================
procedure TfrmExpCadBensSRF.bbtnConfirmarClick(Sender: TObject);
var
   sLinha              : String;
   atxtBens            : TextFile;

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
      qryCadBens.Close;
      qryCadBens.ParamByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
      qryCadBens.ParamByName('DATAMOVINI').AsDateTime := eDtaInicio.Date;
      qryCadBens.ParamByName('DATAMOVFIM').AsDateTime := eDtaFim.Date;
      qryCadBens.Open;
      //----------------------------------------------------------------------------------
      AssignFile(atxtBens , trim(edSelPasta.Text) + '\SRF-IN86.TXT');
      Rewrite(atxtBens);
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := qryCadBens.RecordCount;
      while not qryCadBens.EOF do
      begin
         lblStatus.Caption := 'Gerando Arquivo de Transferência ...';
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         sLinha := '';
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('PLACA').AsString                           , 20);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('NATUREZA').AsString                        ,  1);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('PLACAPRINCIPAL').AsString                  , 20);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('DESCBEM').AsString                         , 45);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('CONTACUSTO').AsString                      , 28);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('CONTADEPREC').AsString                     , 28);
         sLinha := sLinha + CompletaZ(qryCadBens.FieldByName('DTAINCLUSAO').AsString                     ,  8);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('TIPODOC').AsString                         ,  3);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('COMPLNOTA').AsString                       ,  5);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('IDNOTA').AsString                          , 12);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',qryCadBens.FieldByName('VALHISTORICO').AsFloat), 17);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',qryCadBens.FieldByName('VALORG').AsFloat)      , 17);
         sLinha := sLinha + CompletaB(qryCadBens.FieldByName('IDBEM').AsString                           , 12);
         sLinha := sLinha + CompletaZ(qryCadBens.FieldByName('DATAINICIODEP').AsString                   ,  8);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',qryCadBens.FieldByName('TAXADEP').AsFloat)     ,  5);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',qryCadBens.FieldByName('DEPACUMANT').AsFloat)  , 17);
         sLinha := sLinha + CompletaZ(FormatFloat('#0.00',qryCadBens.FieldByName('DEPACUMPER').AsFloat)  , 17);
         sLinha := sLinha + CompletaZ(qryCadBens.FieldByName('DATABAIXA').AsString                       ,  8);
         Writeln(atxtBens,trim(sLinha));
         //-------------------------------------------------------------------------------
         qryCadBens.Next;
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
function TFrmExpCadBensSRF.CompletaB(sCampo : String; iTam : Integer) : String;
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
function TFrmExpCadBensSRF.CompletaZ(sCampo : String; iTam : Integer) : String;
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
function TFrmExpCadBensSRF.RemCharInvalid(sCampo : String) : String;
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
procedure TfrmExpCadBensSRF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryCadBens.Close;
   qryCadBens.UnPrepare;
end;

end.
