unit fExpContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Halcn6DB, Db, DBTables, Wwquery, BfDialogs,
  BrowseFolder, uProcuraDir, wwdbdatetimepicker, CMDateTimePicker, Gauges;

type
  TfrmExpContab = class(TfrmOkCancelar)
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
    qryLancamento: TwwQuery;
    qryLancamentoPLACONTA: TStringField;
    qryLancamentoLACHIST1: TStringField;
    qryLancamentoLACTIPO: TStringField;
    qryLancamentoCODCENTROCUSTO: TStringField;
    qryLancamentoHITCODHIST: TStringField;
    qryLancamentoPLNDATDIA: TDateTimeField;
    qryLancamentoLACVALOR: TFloatField;
    qryLancamentoLACHIST2: TStringField;
    qryLancamentoLACHIST3: TStringField;
    qryLancamentoLACHIST4: TStringField;
    qryLancamentoLACHIST5: TStringField;
    qryLancamentoPLNPLANIL: TFloatField;
    qryLancamentoPLNCODIGO: TFloatField;
    GeraTblFolha2: TCreateHalcyonDataSet;
    tblFolha2: THalcyonDataSet;
    procedure bbtnSelPastaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Function CriarTabela : Boolean;
    Procedure RemoveTabela;
  public
    { Public declarations }
  end;

  eExcessaoCAF = Class(Exception);

var
  frmExpContab: TfrmExpContab;

implementation

{$R *.DFM}

uses uMensErro, uSistema, uAtivoFixo;

procedure TfrmExpContab.bbtnSelPastaClick(Sender: TObject);
begin
   inherited;
   pDirTrabalho.ShowPath := False;
   pDirTrabalho.Caption := 'Pasta de Trabalho';
   pDirTrabalho.Execute;
   edSelPasta.Text := pDirTrabalho.Directory;
end;
//========================================================================================
Function TfrmExpContab.CriarTabela : boolean;
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
procedure TfrmExpContab.RemoveTabela;
begin
   if FileExists(trim(edSelPasta.Text) + '\Folha2.dbf') then
   begin
      tblFolha2.Close;
      DeleteFile(trim(edSelPasta.Text) + '\Folha2.dbf');
   end;
end;
//========================================================================================
procedure TfrmExpContab.bbtnConfirmarClick(Sender: TObject);
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
      if not qryLancamento.Prepared then qryLancamento.Prepare;
      qryLancamento.Close;
      qryLancamento.ParamByName('pIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryLancamento.ParamByName('pDTAINICIO').AsDate   := StrToDate(eDtaInicio.Text);
      qryLancamento.ParamByName('pDTAFIM').AsDate      := StrToDate(eDtaFim.Text);
      qryLancamento.Open;
      if qryLancamento.IsEmpty then
      begin
         MsgDlg('Não existem lançamentos no periodo fornecido!','Erro',mtError,[mbOk],0);
         Raise eExcessaoCAF.Create('Não existem lançamentos contábeis');
      end;
      //----------------------------------------------------------------------------------
      prgBar.MaxValue := qryLancamento.RecordCount;
      prgBar.Progress := 0;
      Application.ProcessMessages;
      while not qryLancamento.EOF do
      begin
         lblStatus.Caption := 'Lançamentos do dia ' + qryLancamentoPLNDATDIA.AsString;
         prgBar.Progress := prgBar.Progress + 1;
         Application.ProcessMessages;
         //-------------------------------------------------------------------------------
         // Converte Tipo de Lançamento
         //-------------------------------------------------------------------------------
         if qryLancamentoLACTIPO.AsString = '0' then
         begin
            sTipo := 'D';
         end else
         begin
            sTipo := 'C';
         end;
         //-------------------------------------------------------------------------------
         // Converte Data de Lançamento
         //-------------------------------------------------------------------------------
         DecodeDate(qryLancamentoPLNDATDIA.AsDateTime,iAno,iMes,iDia);
         sDataLan := AtivoFixo.ComplZeros(inttostr(iDia),2) +
                     AtivoFixo.ComplZeros(inttostr(iMes),2) +
                     AtivoFixo.ComplZeros(inttostr(iAno),2);
         //-------------------------------------------------------------------------------
         // Converte o Valor do Lançamento
         //-------------------------------------------------------------------------------
         sValor := FormatFloat('#0.00',qryLancamentoLACVALOR.AsFloat);
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
         tblFolha2.FieldByName('FLH_CONTA').AsString   := qryLancamentoPLACONTA.AsString;
         tblFolha2.FieldByName('FLH_CONTA1').Clear;
         tblFolha2.FieldByName('FLH_HIST').AsString    := qryLancamentoLACHIST1.AsString;
         tblFolha2.FieldByName('FLH_TIPO').AsString    := sTipo;
         tblFolha2.FieldByName('FLH_CCUST').AsString   := qryLancamentoCODCENTROCUSTO.AsString;
         tblFolha2.FieldByName('FLH_HIERAR').Clear;
         tblFolha2.FieldByName('FLH_HISTOR').AsString  := qryLancamentoHITCODHIST.AsString;
         tblFolha2.FieldByName('FLH_DATLAN').AsString  := sDataLan;
         tblFolha2.FieldByName('FLH_VALOR').AsString   := sValor;
         tblFolha2.FieldByName('FLH_HIST2').AsString   := qryLancamentoLACHIST2.AsString;
         tblFolha2.FieldByName('FLH_HIST3').AsString   := qryLancamentoLACHIST3.AsString;
         tblFolha2.FieldByName('FLH_HIST4').AsString   := qryLancamentoLACHIST4.AsString;
         tblFolha2.FieldByName('FLH_HIST5').AsString   := qryLancamentoLACHIST5.AsString;
         tblFolha2.FieldByName('FLH_PLANIL').AsInteger := 0;
         tblFolha2.Post;
         //-------------------------------------------------------------------------------
         qryLancamento.Next;
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
procedure TfrmExpContab.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryLancamento.Close;
   tblFolha2.Close;
   qryLancamento.UnPrepare;
end;

end.
