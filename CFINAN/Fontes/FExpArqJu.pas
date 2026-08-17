unit FExpArqJu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Db, Wwdatsrc, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker, ComCtrls;

type
  TfrmExpArqJu = class(TfrmSairAjuda)
    bbtnExporta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gbDadosFixos: TGroupBox;
    qryParametros: TwwQuery;
    updParametros: TUpdateSQL;
    dsParametros: TwwDataSource;
    lblCodEmp: TLabel;
    lblCodDir: TLabel;
    dbedCodEmp: TwwDBEdit;
    dbedCodDir: TwwDBEdit;
    prgBar: TProgressBar;
    qryDadosFinanc: TwwQuery;
    gbDatas: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    dedInicial: TCMDateTimePicker;
    dedFinal: TCMDateTimePicker;
    qryParametrosIDPESSOA: TFloatField;
    qryParametrosCODEMPJURERE: TStringField;
    qryParametrosCODDIRJURERE: TStringField;
    qryDadosFinancCLASSE: TStringField;
    qryDadosFinancRECPAG: TStringField;
    qryDadosFinancVALOR: TFloatField;
    qryDadosFinancDATALANCFINAN: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnExportaClick(Sender: TObject);
  private
    { Private declarations }
    Function ZE(sString : String; iTamanho : Integer) : String;
  public
    { Public declarations }
  end;

var
  frmExpArqJu: TfrmExpArqJu;

implementation

Uses uSistema, uMensErro, dBaseDados, uDataBase, uFuncaoGeral;

{$R *.DFM}

procedure TfrmExpArqJu.FormCreate(Sender: TObject);
begin
  inherited;
  prgBar.Visible := false;
  qryParametros.Close;
  qryParametros.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
  qryParametros.Open;
end;

Function TfrmExpArqJu.ZE(sString : String; iTamanho : Integer) : String;
var i, iLim : Integer;
begin
   iLim   := iTamanho - length(trim(sString));
   Result := '';
   For i:= 1 to iLim do
      Result := Result + '0';
   Result := Result + trim(sString);
end;


procedure TfrmExpArqJu.bbtnExportaClick(Sender: TObject);
var sNomeArquivo, sLinha: string;
    ArquivoTexto : TextFile;
begin
  inherited;
  if trim(dbedCodEmp.Text) = '' then begin
    MsgDlg('Obrigatório Preencher o Código da Empresa','Erro',mtError,[mbOk],0);
    dbedCodEmp.SetFocus;
    Exit;
  end;
  if trim(dbedCodDir.Text) = '' then begin
    MsgDlg('Obrigatório Preencher o Código da Diretoria','Erro',mtError,[mbOk],0);
    dbedCodDir.SetFocus;
    Exit;
  end;
  try
     AplicaAlteracoes([qryParametros]);
  except
     raise;
  end;
  if trim(dedInicial.Text) = '' then begin
    MsgDlg('Obrigatório Preencher a Data Inicial','Erro',mtError,[mbOk],0);
    dedInicial.SetFocus;
    Exit;
  end;
  if trim(dedFinal.Text) = '' then begin
    MsgDlg('Obrigatório Preencher a Data Final','Erro',mtError,[mbOk],0);
    dedFinal.SetFocus;
    Exit;
  end;
  if dedFinal.Date < dedInicial.Date then begin
    MsgDlg('Data Final não pode ser menor do que Data Inicial','Erro',mtError,[mbOk],0);
    dedInicial.SetFocus;
    Exit;
  end;
  prgBar.Visible := true;
  Try
    sNomeArquivo := 'PR' + FormatDateTime('yyyymmdd', date) + '.TXT';
    if MsgDlg('Será Gerado um arquivo chamado ' + sNomeArquivo + ' no diretório corrente. Deseja prosseguir?','Aviso',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
       //Cria Um Novo Arquivo ou Sobrescreve um já existente
       screen.cursor := crHourglass;
       AssignFile(ArquivoTexto, sNomeArquivo);
       ReWrite(Arquivotexto);
       //
       with qryDadosFinanc do begin
          Close;
          ParamByName('DATAINI').AsString   := dedInicial.Text;
          ParamByName('DATAFIM').AsString   := dedFinal.Text;
          ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
          Open;
          //
          prgBar.Position := 0;
          prgBar.Max      := RecordCount;
          First;
          While not EOF do begin
             prgBar.Position := prgBar.Position + 1;
             sLinha := '';
             sLinha := sLinha + ZE(qryParametrosCODEMPJURERE.AsString,3); //Empresa
             sLinha := sLinha + ZE(qryParametrosCODDIRJURERE.AsString,4); //Diretoria
             sLinha := sLinha + '0000'; //Divisão
             sLinha := sLinha + '0000'; //Projeto
             sLinha := sLinha + ZE(qryDadosFinancCLASSE.AsString,4); //Classe
             sLinha := sLinha + '0000'; //SubClasse
             sLinha := sLinha + qryDadosFinancDATALANCFINAN.AsString; //Data
             sLinha := sLinha + ZE(FormatFloat('0',qryDadosFinancVALOR.AsFloat),11); //Valor
             sLinha := sLinha + qryDadosFinancRECPAG.AsString; //R = Receber, P = Pagar
             WriteLn(ArquivoTexto, sLinha);
             Next;
          end;
       end;
       CloseFile(ArquivoTexto);
       screen.cursor := crDefault;
       MsgDlg('Geração Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
    end;
  Except
    MsgDlg('Problemas na Geração do TXT','Erro',mtError,[mbOk],0);
    raise;
  end;
end;

end.
