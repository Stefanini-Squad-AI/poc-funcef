unit FExpArqJurereMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdbedit, ComCtrls, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlParamFinanc,
  uCmSqlParams;

type
  TfrmExpArqJurereMT = class(TfrmSairAjuda)
    bbtnExporta: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    prgBarExporta: TProgressBar;
    gbDadosFixos: TGroupBox;
    lblCodEmp: TLabel;
    lblCodDir: TLabel;
    dbedCodEmp: TwwDBEdit;
    dbedCodDir: TwwDBEdit;
    gbDatas: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    cds: TCMClientDataSet;
    ds: TwwDataSource;
    cdsDadosFinanc: TCMClientDataSet;
    spDadosFinanc: TCMSqlParams;
    procedure bbtnExportaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    CtrlParamFinanc : TCtrlParamFinanc;
    function PreencheZeros(sString : String; iTamanho : Integer) : String;
  public
    { Public declarations }
  end;

var
  frmExpArqJurereMT: TfrmExpArqJurereMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmExpArqJurereMT.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True);
   Cds.Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
   CtrlParamFinanc.CdsParamFinanc:=cds;
   Cds.Edit;
end;

procedure TfrmExpArqJurereMT.bbtnExportaClick(Sender: TObject);
var
   sNomeArq: String;
   sLinha  : String; 
   Arq     : TextFile;
begin
   inherited;
   if (Trim(dbedCodEmp.Text)='') then
    begin
       MsgDlg('Obrigatório Preencher o Código da Empresa','Erro',mtError,[mbOk],0);
       dbedCodEmp.SetFocus;
       exit;
    end;

   if (Trim(dbedCodDir.Text)='') then
    begin
       MsgDlg('Obrigatório Preencher o Código da Diretoria','Erro',mtError,[mbOk],0);
       dbedCodDir.SetFocus;
       exit;
    end;

   if (Trim(deDataInicial.Text)='') then
    begin
       MsgDlg('Obrigatório Preencher a Data Inicial','Erro',mtError,[mbOk],0);
       deDataInicial.SetFocus;
       exit;
    end;

   if (Trim(deDataFinal.Text)='') then
    begin
       MsgDlg('Obrigatório Preencher a Data Final','Erro',mtError,[mbOk],0);
       deDataFinal.SetFocus;
       exit;
    end;

   if (deDataFinal.Date<deDataInicial.Date) then
    begin
       MsgDlg('Data Final não pode ser menor do que Data Inicial','Erro',mtError,[mbOk],0);
       deDataInicial.SetFocus;
       exit;
    end;

   cds.Post;
   if not(CtrlParamFinanc.AplicaAtualParamFinanc) then
    begin
       MsgDlg(CtrlParamFinanc.MessageInfo,'Erro',mtError,[mbOk],0);
       exit;
    end;

   try
      sNomeArq:='PR'+FormatDateTime('yyyymmdd',date)+'.TXT';
      if MsgDlg('Será Gerado um arquivo chamado '+sNomeArq+
                ' no diretório corrente. Deseja prosseguir ?','Aviso',
                mtConfirmation,[mbYes, mbNo],0)=mrYes then
       begin
          AssignFile(Arq,sNomeArq);
          Rewrite(Arq);

          with cdsDadosFinanc do
          begin
             Close;
             spDadosFinanc.Prepare;
             spDadosFinanc.ParamByName('DATAINI').AsString:=
                           FormatDateTime('dd/mm/yyyy',deDataInicial.Date);
             spDadosFinanc.ParamByName('DATAFIM').AsString:=
                           FormatDateTime('dd/mm/yyyy',deDataFinal.Date);
             spDadosFinanc.ParamByName('IDPESSOA').AsFloat:=Sistema.idEmpresa;
             spDadosFinanc.Open;

             prgBarExporta.Max:=RecordCount;
             prgBarExporta.Position:=0;

             First;
             while not(Eof) do
             begin
                sLinha := '';
                sLinha := sLinha + PreencheZeros(cds.FieldByName('CODEMPJURERE').AsString,3); //Empresa
                sLinha := sLinha + PreencheZeros(cds.FieldByName('CODDIRJURERE').AsString,4); //Diretoria
                sLinha := sLinha + '0000'; //Divisão
                sLinha := sLinha + '0000'; //Projeto
                sLinha := sLinha + PreencheZeros(FieldByName('CLASSE').AsString,4); //Classe
                sLinha := sLinha + '0000'; //SubClasse
                sLinha := sLinha + FieldByName('DATALANCFINAN').AsString; //Data
                sLinha := sLinha + PreencheZeros(FormatFloat('0',FieldByName('VALOR').AsFloat),11); //Valor
                sLinha := sLinha + FieldByName('RECPAG').AsString; //R = Receber, P = Pagar
                WriteLn(Arq, sLinha);

                Next;
                prgBarExporta.StepIt;
             end;
          end;
          CloseFile(Arq);
          MsgDlg('Geração Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
       end;
   except
      MsgDlg('Problemas na Geração do TXT','Erro',mtError,[mbOk],0);
      raise;
   end;
end;

function TfrmExpArqJurereMT.PreencheZeros(sString: String;
  iTamanho: Integer): String;
var
  i, iLim : Integer;
begin
   iLim   := iTamanho - Length(Trim(sString));
   Result := '';
   for i:= 1 to iLim do Result := Result + '0';
   Result := Result + Trim(sString);
end;

end.

