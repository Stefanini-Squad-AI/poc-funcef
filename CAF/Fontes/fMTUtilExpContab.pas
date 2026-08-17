unit fMTUtilExpContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, 
  TB97Tlbr, TB97, ExtCtrls, Halcn6DB, Db, DBTables, Wwquery, BfDialogs,
  BrowseFolder, uProcuraDir, wwdbdatetimepicker, CMDateTimePicker, Gauges,
  uCmSqlParams, DBClient, uCMClientDataSet, uCMTypes, uCtrlPadroes,
  IvEMulti;

type
  TfrmMTUtilExpContab = class(TfrmOkCancelar)
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
    GeraTblFolha2: TCreateHalcyonDataSet;
    tblFolha2: THalcyonDataSet;
    cdsLancamento: TCMClientDataSet;
    sqlLancamento: TCMSqlParams;
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function CriarTabela : Boolean;
    procedure RemoveTabela;
    function ComplZeros(sCodigo : String; iTam : Integer) : string;
  public
    { Public declarations }
  end;

var
  frmMTUtilExpContab: TfrmMTUtilExpContab;

implementation

{$R *.DFM}

uses uMensErro, uSistema;

procedure TfrmMTUtilExpContab.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   pDirTrabalho.ShowPath := False;
   pDirTrabalho.Caption := 'Pasta de Trabalho';
   pDirTrabalho.Execute;
   edSelPasta.Text := pDirTrabalho.Directory;
end;
//========================================================================================
Function TfrmMTUtilExpContab.CriarTabela : boolean;
begin
   RemoveTabela;
   tblFolha2.DatabaseName := edSelPasta.Text;
   tblFolha2.TableName    := 'Folha2.dbf';
   //-------------------------------------------------------------------------------------
   GeraTblFolha2.CreateFields.Clear;
   GeraTblFolha2.CreateFields.Add('FLH_CONTA;C;18;0');
   GeraTblFolha2.CreateFields.Add('FLH_CONTA1;C;21;0');
   GeraTblFolha2.CreateFields.Add('FLH_HIST;C;40;0');
   GeraTblFolha2.CreateFields.Add('FLH_TIPO;C;1;0');
   GeraTblFolha2.CreateFields.Add('FLH_CCUST;C;18;0');
   GeraTblFolha2.CreateFields.Add('FLH_HIERAR;C;23;0');
   GeraTblFolha2.CreateFields.Add('FLH_HISTOR;C;4;0');
   GeraTblFolha2.CreateFields.Add('FLH_DATLAN;C;6;0');
   GeraTblFolha2.CreateFields.Add('FLH_VALOR;C;16;0');
   GeraTblFolha2.CreateFields.Add('FLH_HIST2;C;40;0');
   GeraTblFolha2.CreateFields.Add('FLH_HIST3;C;40;0');
   GeraTblFolha2.CreateFields.Add('FLH_HIST4;C;40;0');
   GeraTblFolha2.CreateFields.Add('FLH_HIST5;C;40;0');
   GeraTblFolha2.CreateFields.Add('FLH_PLANIL;N;5;0');
   if not GeraTblFolha2.Execute then
   begin
      MsgDlg('Não foi possível criar a estrutura da tabela de exportação!','Erro',mtError,[mbOk],0);
      Result := False;
      exit;
   end else
   begin
      Result := True;
   end;
   //-------------------------------------------------------------------------------------
   tblFolha2.Open;
end;
//========================================================================================
procedure TfrmMTUtilExpContab.RemoveTabela;
begin
   if FileExists(trim(edSelPasta.Text) + '\Folha2.dbf') then
   begin
      tblFolha2.Close;
      DeleteFile(trim(edSelPasta.Text) + '\Folha2.dbf');
   end;
end;
//========================================================================================
procedure TfrmMTUtilExpContab.bbtnConfirmarClick(Sender: TObject);
Var
   sTipo, sDataLan, sValor : String;
   iDia, iMes, iAno        : Word;
begin
   inherited;
   //-------------------------------------------------------------------------------------
   if edSelPasta.Text = '' then
   begin
      MsgDlg('Selecione a pasta onde será criada a tabela de exportação!','Erro',mtError,[mbOk],0);
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
   // Gera o arquivo de exportação
   //-------------------------------------------------------------------------------------
   if not CriarTabela then
   begin
      MsgDlg('Não foi possível gerar o arquivo de exportação.'+#13+
             'Experimente selecionar outra pasta.','Erro',mtError,[mbOk],0);
      exit;
   end;
   //-------------------------------------------------------------------------------------
   try
      lblStatus.Caption := 'Preparando...';
      prgBar.MaxValue := 1;
      prgBar.Progress := 0;
      pnlStatus.Visible := True;
      //----------------------------------------------------------------------------------
      sqlLancamento.Prepare;
      sqlLancamento.ParamByName('pIDPESSOA').AsInteger   := Sistema.IdEmpresa;
      sqlLancamento.ParamByName('pDTAINICIO').AsDate     := StrToDate(eDtaInicio.Text);
      sqlLancamento.ParamByName('pDTAFIM').AsDate        := StrToDate(eDtaFim.Text);
      sqlLancamento.Open;
      if cdsLancamento.IsEmpty then
      begin
         MsgDlg('Não existem lançamentos no periodo fornecido!','Erro',mtError,[mbOk],0);
         Raise Exception.Create('Não existem lançamentos contábeis');
      end;
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := cdsLancamento.RecordCount;
      prgBar.Progress := 0;
      Application.ProcessMessages;
      while not cdsLancamento.EOF do
      begin
         lblStatus.Caption := 'Lançamentos do dia ' + cdsLancamento.FieldByName('PLNDATDIA').AsString;
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Converte Tipo de Lançamento
         //-------------------------------------------------------------------------------
         if cdsLancamento.FieldByName('LACTIPO').AsString = '0' then
         begin
            sTipo := 'D';
         end else
         begin
            sTipo := 'C';
         end;
         //-------------------------------------------------------------------------------
         // Converte Data de Lançamento
         //-------------------------------------------------------------------------------
         DecodeDate(cdsLancamento.FieldByName('PLNDATDIA').AsDateTime,iAno,iMes,iDia);
         sDataLan := ComplZeros(inttostr(iDia),2) +
                     ComplZeros(inttostr(iMes),2) +
                     ComplZeros(inttostr(iAno),2);
         //-------------------------------------------------------------------------------
         // Converte o Valor do Lançamento
         //-------------------------------------------------------------------------------
         sValor := FormatFloat('#0.00',cdsLancamento.FieldByName('LACVALOR').AsFloat);
         if pos('.',sValor) <> 0 then
         begin
            sValor := copy(sValor,1,pos('.',sValor)-1) + copy(sValor,pos('.',sValor) + 1,2);
         end else
         if pos(',',sValor) <> 0 then
         begin
            sValor := copy(sValor,1,pos(',',sValor)-1) + copy(sValor,pos(',',sValor) + 1,2);
         end;
         //-------------------------------------------------------------------------------
         tblFolha2.Append;
         tblFolha2.FieldByName('FLH_CONTA').AsString   := cdsLancamento.FieldByName('PLACONTA').AsString;
         tblFolha2.FieldByName('FLH_CONTA1').Clear;
         tblFolha2.FieldByName('FLH_HIST').AsString    := cdsLancamento.FieldByName('LACHIST1').AsString;
         tblFolha2.FieldByName('FLH_TIPO').AsString    := sTipo;
         tblFolha2.FieldByName('FLH_CCUST').AsString   := cdsLancamento.FieldByName('CODCENTROCUSTO').AsString;
         tblFolha2.FieldByName('FLH_HIERAR').Clear;
         tblFolha2.FieldByName('FLH_HISTOR').AsString  := cdsLancamento.FieldByName('HITCODHIST').AsString;
         tblFolha2.FieldByName('FLH_DATLAN').AsString  := sDataLan;
         tblFolha2.FieldByName('FLH_VALOR').AsString   := sValor;
         tblFolha2.FieldByName('FLH_HIST2').AsString   := cdsLancamento.FieldByName('LACHIST2').AsString;
         tblFolha2.FieldByName('FLH_HIST3').AsString   := cdsLancamento.FieldByName('LACHIST3').AsString;
         tblFolha2.FieldByName('FLH_HIST4').AsString   := cdsLancamento.FieldByName('LACHIST4').AsString;
         tblFolha2.FieldByName('FLH_HIST5').AsString   := cdsLancamento.FieldByName('LACHIST5').AsString;
         tblFolha2.FieldByName('FLH_PLANIL').AsInteger := 0;
         tblFolha2.Post;
         //-------------------------------------------------------------------------------
         cdsLancamento.Next;
      end;
      //----------------------------------------------------------------------------------
      tblFolha2.Close;
      MsgDlg('Operação Realizada!','Informação',mtInformation,[mbOk],0);
   except
      RemoveTabela;
      MsgDlg('Operação não Realizada!','Erro',mtError,[mbOk],0);
   end;
   pnlStatus.Visible := False;
end;
//========================================================================================
procedure TfrmMTUtilExpContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsLancamento.Close;
   tblFolha2.Close;
end;
//========================================================================================
function TfrmMTUtilExpContab.ComplZeros(sCodigo : String; iTam : Integer) : string;
var
   iCont, iLen            : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
      sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   iLen := length(sFull);
   sResult := '';
   iCont := iTam;
   while iCont >= 1 do
   begin
      sResult := sFull[iLen] + sResult;
      iCont := iCont - 1;
      iLen  := iLen - 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;

end.
