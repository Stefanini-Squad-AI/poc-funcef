unit FMontaDispFinancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, ComCtrls, Grids, Wwdbigrd,
  Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,
  DBClient, uCMClientDataSet, uCtrlDispFinanc, uCtrlParamFinanc,
  uCmSqlParams;

type
  TfrmMontaDispFinancMT = class(TfrmSairAjuda)
    lblDataDisp: TLabel;
    deDataDisp: TCMDateTimePicker;
    spdTodos: TSpeedButton;
    spdInverter: TSpeedButton;
    sbBloqueiaData: TSpeedButton;
    prgBarCalc: TProgressBar;
    dsLancamento: TwwDataSource;
    cdsLancamento: TCMClientDataSet;
    wwDBGrid4: TwwDBGrid;
    sqlProvisorio: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure deDataDispExit(Sender: TObject);
    procedure spdTodosClick(Sender: TObject);
    procedure spdInverterClick(Sender: TObject);
    procedure sbBloqueiaDataClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
  private
    { Private declarations }
    iContaMarcados       : Integer;
    CtrlDisponFinanc     : TCtrlDisponFinanc;
    CtrlParamFinanc      : TCtrlParamFinanc;
    dDataBloqueioDisp    : TDateTime;
    DadosLancamentoVazio : OleVariant;
    procedure cdsLancamentoFLGDISPChange(Sender: TField);
  public
    { Public declarations }
  end;

var
  frmMontaDispFinancMT: TfrmMontaDispFinancMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmMontaDispFinancMT.FormCreate(Sender: TObject);
begin
   inherited;
   iContaMarcados:=0;

   //Inicializa CtrlDisponFinanc
   CtrlDisponFinanc:=TCtrlDisponFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                              Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlDisponFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cdsLancamento
   CtrlDisponFinanc.cdsLancamento:=cdsLancamento;
   cdsLancamento.Data:=CtrlDisponFinanc.ListLancamentos(-1,0); //Vazio
   DadosLancamentoVazio:=cdsLancamento.Data;

   //Busca data de Bloqueio da Disponibilidade
   with TCMClientDataSet.Create(Self) do
   try
      Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
      dDataBloqueioDisp:=FieldByName('DATABLOQDISPFINAN').AsDateTime;
   finally
      Free;
   end;

   deDataDisp.Date:=Date;
end;

procedure TfrmMontaDispFinancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlDisponFinanc.Free;
   CtrlParamFinanc.Free;
   inherited;
end;

procedure TfrmMontaDispFinancMT.deDataDispExit(Sender: TObject);
begin
   if (ActiveControl=bbtnSair) then Exit;
   if (deDataDisp.Date<=dDataBloqueioDisp) then
    begin
       MsgDlg('Data da Disponibilidade não pode ser menor ou igual a data do último bloqueio',
              'Erro',mtError,[mbOk],0);
       deDataDisp.SetFocus;
       Exit;
    end;
   //Carrega cdsLancamento
   cdsLancamento.Close;
   cdsLancamento.Data:=CtrlDisponFinanc.ListLancamentos(Sistema.IdEmpresa,deDataDisp.Date);
   TStringField(cdsLancamento.FieldByName('FLGDISP')).OnChange:=cdsLancamentoFLGDISPChange;
   TFloatField(cdsLancamento.FieldByName('VALORLANCFINAN')).DisplayFormat:='#,##0.00';
end;

procedure TfrmMontaDispFinancMT.cdsLancamentoFLGDISPChange(Sender: TField);
begin
   if (cdsLancamento.FieldByName('FLGDISP').AsString='S') then
    begin
       cdsLancamento.FieldByName('DATADISPFINANC').AsDateTime:=deDataDisp.Date;
       Inc(iContaMarcados);
    end
   else
    begin
       cdsLancamento.FieldByName('DATADISPFINANC').Clear;
       Dec(iContaMarcados);
    end;
end;

procedure TfrmMontaDispFinancMT.spdTodosClick(Sender: TObject);
begin
   cdsLancamento.DisableControls;
   try
      prgBarCalc.Position:=0;
      prgBarCalc.Max:=cdsLancamento.RecordCount;
      cdsLancamento.First;
      while not(cdsLancamento.Eof) do
      begin
         cdsLancamento.Edit;
         cdsLancamento.FieldByName('FLGDISP').AsString:='S';
         cdsLancamento.Post;
         cdsLancamento.Next;
         prgBarCalc.StepIt;
      end;
   finally
      cdsLancamento.EnableControls;
   end;
end;

procedure TfrmMontaDispFinancMT.spdInverterClick(Sender: TObject);
begin
   cdsLancamento.DisableControls;
   try
      prgBarCalc.Position:=0;
      prgBarCalc.Max:=cdsLancamento.RecordCount;
      cdsLancamento.First;
      while not(cdsLancamento.Eof) do
      begin
         cdsLancamento.Edit;
         
         if (cdsLancamento.FieldByName('FLGDISP').AsString='S') then
            cdsLancamento.FieldByName('FLGDISP').AsString:='N'
         else
            cdsLancamento.FieldByName('FLGDISP').AsString:='S';

         cdsLancamento.Post;
         cdsLancamento.Next;
         prgBarCalc.StepIt;
      end;
   finally
      cdsLancamento.EnableControls;
   end;
end;

procedure TfrmMontaDispFinancMT.sbBloqueiaDataClick(Sender: TObject);
begin
  if MsgDlg('Confirma o Bloqueio desta Data? ','Confirmação',mtConfirmation,[mbYes,mbNo],0)=mrYes then
   begin
      if CtrlDisponFinanc.EncerraDisponibilidade(deDataDisp.Date) then
       begin
          MsgDlg('Bloqueio Efetuada com Sucesso','Aviso',mtWarning,[mbOk],0);
          iContaMarcados:=0;
       end
      else
         MsgDlg(CtrlDisponFinanc.MessageInfo,'Erro',mtError,[mbOk],0);
   end;
end;

procedure TfrmMontaDispFinancMT.bbtnSairClick(Sender: TObject);
begin
   if (iContaMarcados<>0) then
    begin
       if not(CtrlDisponFinanc.AplicaMarcacoesDisp) then
          MsgDlg(CtrlDisponFinanc.MessageInfo,'Erro',mtError,[mbOk],0);
    end;
   inherited;
end;

end.
