unit FGeraFaturaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, TREdit, Db, Wwdatsrc, DBTables, IvDictio, IvMulti, IvEMulti,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet,
  uCtrlGeraFatura, uCtrlPeriodo, wwclient, wwdblook, CMProcuraSubTipo,
  uCtrlPessoaHotel, ComCtrls;

type
  TfrmGeraFaturaMT = class(TfrmOkCancelar)
    dsNotasaFat: TwwDataSource;
    cdsNotasaFat: TwwClientDataSet;
    cdsHotel: TwwClientDataSet;
    pcGeraFatura: TPageControl;
    tbsParametros: TTabSheet;
    pnlFiltro: TPanel;
    lblDataFaturamento: TLabel;
    lblHotel: TLabel;
    spdSeleciona: TSpeedButton;
    spdInverter: TSpeedButton;
    spdTodos: TSpeedButton;
    deDataFaturamento: TCMDateTimePicker;
    dblcHotel: TwwDBLookupCombo;
    cmpcCliente: TCMProcuraForCli;
    dbgrFaturas: TwwDBGrid;
    tbsMensagens: TTabSheet;
    mmMensagens: TMemo;
    prgBarGeraFatura: TProgressBar;
    lblStatus: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spdInverterClick(Sender: TObject);
    procedure spdTodosClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure spdSelecionaClick(Sender: TObject);
  private
    { Private declarations }
    GeraFatura  : TCtrlGeraFatura;
    Periodo     : TCtrlPeriodo;
    PessoaHotel : TCtrlPessoaHotel;
    procedure SelecionaNotas(iEmpresa, iHotel, iCliente : Double; sDataFaturamento : String);
    Procedure Progresso(vParams : Array of Variant);
  public
    { Public declarations }
  end;

var
  frmGeraFaturaMT: TfrmGeraFaturaMT;

implementation

uses uMensErro,uDataBase, DBaseDados,USistema,UModulo,UDocumento,UFuncaoGeral,ULancContab,uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmGeraFaturaMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   mmMensagens.Lines.Clear;
   if cdsNotasaFat.IsEmpty then
      SelecionaNotas(Sistema.idEmpresa,StrToIntDef(dblcHotel.LookUpValue,0),cmpcCliente.ForCliReg.Id,deDataFaturamento.Text);
   //
   If cdsNotasaFat.IsEmpty then begin
      MsgDlg('Não há Nenhuma Fatura a Gerar neste Hotel.','Aviso',mtWarning,[mbOk],0);
      exit;
   end;
   if MsgDlg('Confirma a Geração da Fatura das Notas Selecionadas','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then begin
      pcGeraFatura.ActivePage := tbsParametros;
      deDataFaturamento.SetFocus;
      exit;
   end;
   if not GeraFatura.GeraFatura(GeraFatura.ProgressFileName,deDataFaturamento.Text,Sistema.IdEspAcesso,Sistema.idEmpresa,
          Sistema.idModulo,Sistema.idUsuario,StrToIntDef(dblcHotel.LookUpValue,0),cmpcCliente.ForCliReg.Id,
          Sistema.UsaPlanoPatro,ParamIntegra.IntegraContab) then begin
      MsgDlg('Geração não efetuada. '+GeraFatura.MessageInfo,'Erro',mtError,[mbOk],0);
      pcGeraFatura.ActivePage := tbsMensagens;
      mmMensagens.SetFocus;
   end else begin
      MsgDlg('Fatura(s) Gerada(s) com sucesso','Aviso',mtWarning,[mbOk],0);
      pcGeraFatura.ActivePage := tbsParametros;
      deDataFaturamento.SetFocus;
   end;
   SelecionaNotas(Sistema.idEmpresa,StrToIntDef(dblcHotel.LookUpValue,0),cmpcCliente.ForCliReg.Id,deDataFaturamento.Text);
end;

procedure TfrmGeraFaturaMT.FormCreate(Sender: TObject);
begin
  inherited;
  PessoaHotel := TCtrlPessoaHotel.Create;
  PessoaHotel.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //
  Periodo := TCtrlPeriodo.Create;
  Periodo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //
  GeraFatura := TCtrlGeraFatura.Create;
  GeraFatura.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //
  GeraFatura.Progresso := Progresso;
  GeraFatura.cdsNotasaFatTela := cdsNotasaFat;
  cdsHotel.Data := PessoaHotel.ListaHotel(Sistema.idEmpresa,0);
  SelecionaNotas(-1,-1,-1,'');
end;

procedure TfrmGeraFaturaMT.FormActivate(Sender: TObject);
begin
  inherited;
  pcGeraFatura.ActivePage := tbsParametros;
  deDataFaturamento.Date:=Date;
  deDataFaturamento.SetFocus;
end;

procedure TfrmGeraFaturaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Periodo.Free;
  GeraFatura.Free;
  PessoaHotel.Free;
end;

procedure TfrmGeraFaturaMT.SelecionaNotas(iEmpresa, iHotel, iCliente : Double; sDataFaturamento : String);
begin
   cdsNotasaFat.Data := GeraFatura.ListaNotasaFatTela(iEmpresa, iHotel, iCliente,sDataFaturamento); 
   TFloatField(cdsNotasaFat.FieldByName('TOTVALS')).DisplayFormat := '#,##0.00';
   TFloatField(cdsNotasaFat.FieldByName('TOTVALX')).DisplayFormat := '#,##0.00';
   cdsNotasaFat.ControlType.Add('FCHECK;CheckBox;S;N');
end;

procedure TfrmGeraFaturaMT.spdInverterClick(Sender: TObject);
begin
  inherited;
  cdsNotasaFat.DisableControls;
  cdsNotasaFat.First;
  while not cdsNotasaFat.Eof do begin
     cdsNotasaFat.Edit;
     if cdsNotasaFat.FieldByName('FCHECK').AsString = 'N' then
        cdsNotasaFat.FieldByName('FCHECK').AsString := 'S'
     else
        cdsNotasaFat.FieldByName('FCHECK').AsString := 'N';
     cdsNotasaFat.Post;
     cdsNotasaFat.Next;
  end;
  cdsNotasaFat.First;
  cdsNotasaFat.EnableControls;
end;

procedure TfrmGeraFaturaMT.spdTodosClick(Sender: TObject);
begin
  inherited;
  cdsNotasaFat.DisableControls;
  cdsNotasaFat.First;
  while not cdsNotasaFat.Eof do begin
     cdsNotasaFat.Edit;
     cdsNotasaFat.FieldByName('FCHECK').AsString := 'S';
     cdsNotasaFat.Post;
     cdsNotasaFat.Next;
  end;
  cdsNotasaFat.First;
  cdsNotasaFat.EnableControls;
end;

procedure TfrmGeraFaturaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  cdsNotasaFat.CancelUpdates;
end;

procedure TfrmGeraFaturaMT.spdSelecionaClick(Sender: TObject);
begin
  inherited;
  SelecionaNotas(Sistema.idEmpresa,StrToIntDef(dblcHotel.LookUpValue,0),cmpcCliente.ForCliReg.id,deDataFaturamento.Text);
end;

procedure TfrmGeraFaturaMT.Progresso(vParams: array of Variant);
begin
   Try
     prgBarGeraFatura.Max      := vParams[1];
     prgBarGeraFatura.Position := vParams[2];
     lblStatus.Caption         := vParams[3];
     if vParams[4] <> '' then
        mmMensagens.Lines.Add(vParams[4]);
   finally
     Repaint;
   End;
end;

end.
