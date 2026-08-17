unit fParamTransfPatGrpA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Db, wwdblook,
  Wwquery, ComCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamTransfPatGrpA = class(TfrmOkCancelar)
    Label1: TLabel;
    dtedIni: TCMDateTimePicker;
    qryParamCaf: TwwQuery;
    dtedFim: TCMDateTimePicker;
    Label2: TLabel;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafIDPESSOA: TFloatField;
    rdgGrupo: TRadioGroup;
    qryGrupoIni: TwwQuery;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    cmbGrupoIni: TwwDBLookupCombo;
    Label3: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbGrupoIniExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iGrupoIni : Integer;
    sMascaraGrupo : String;
  end;

var
  frmParamTransfPatGrpA: TfrmParamTransfPatGrpA;

implementation

uses dRelOperCaf, uSistema, uMensErro;

{$R *.DFM}

procedure TfrmParamTransfPatGrpA.FormCreate(Sender: TObject);
Var
   iAux : Integer;
begin
   inherited;
   if not qryGrupoIni.Prepared then
      qryGrupoIni.Prepare;
   qryGrupoIni.Open;
   //-------------------------------------------------------------------------------------
   qryParamCaf.Close;
   qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryParamCaf.Open;
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   //-------------------------------------------------------------------------------------
   dtedIni.Date := date - 30;
   dtedFim.Date := date;
end;
//========================================================================================
procedure TfrmParamTransfPatGrpA.FormActivate(Sender: TObject);
begin
   inherited;
   rdgGrupo.SetFocus;
end;
//========================================================================================
procedure TfrmParamTransfPatGrpA.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf.qryTransfPatGrpA do
   begin
      Close;
      if iGrupoIni <> 0 then
      begin
         SQL.Strings[11] := ' AND (B.IDGRUPO = '+IntToStr(iGrupoIni)+') ';
      end else
      begin
         SQL.Strings[11] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if rdgGrupo.ItemIndex = 0 then
      begin
         SQL.Strings[12] := ' AND (G.FLGIMOVEL = 0) ';
      end else
      if rdgGrupo.ItemIndex = 1 then
      begin
         SQL.Strings[12] := ' AND (G.FLGIMOVEL = 1) ';
      end else
      begin
         SQL.Strings[12] := ' ';
      end;
      //----------------------------------------------------------------------------------
      ParamByName('PDATAINI').AsDateTime := dtedIni.Date;
      ParamByName('PDATAFIM').AsDateTime := dtedFim.Date;
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      ppLabel107.Text := dtedIni.Text;
      ppLabel108.Text := dtedFim.Text;
      ppDBText44.DisplayFormat := sMascaraGrupo;
      ppDBText40.DisplayFormat := sMascaraGrupo;
      ppDBText41.DisplayFormat := '#,0.00;(#,0.00)';
      ppDBCalc5.DisplayFormat  := '#,0.00;(#,0.00)';
      ppDBCalc6.DisplayFormat  := '#,0.00;(#,0.00)';
      //----------------------------------------------------------------------------------
      qryTransfPatGrpA.Open;
      Screen.Cursor := crDefault;
      if qryTransfPatGrpA.IsEmpty then
         if cmbGrupoIni.Text <> '' then
            MsgDlg('Não há movimentações no Periodo para o Grupo especificado!',
                   'Erro',mtError,[mbOk],0)
         else
            MsgDlg('Não há movimentações no Periodo especificado!',
                   'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamTransfPatGrpA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryGrupoIni.Close;
   qryGrupoIni.UnPrepare;
end;
//========================================================================================
procedure TfrmParamTransfPatGrpA.cmbGrupoIniExit(Sender: TObject);
begin
   inherited;
   if cmbGrupoIni.Text = '' then
      iGrupoIni := 0
   else
      iGrupoIni := qryGrupoIni.FieldByName('IDGRUPO').AsInteger;
end;

end.
