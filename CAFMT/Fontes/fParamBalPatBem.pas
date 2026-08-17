unit fParamBalPatBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamBalPatBem = class(TfrmOkCancelar)
    qryGrupoIni: TwwQuery;
    Label1: TLabel;
    Label6: TLabel;
    dtedfim: TCMDateTimePicker;
    cmbGrupoIni: TwwDBLookupCombo;
    rdgrpDeprec: TRadioGroup;
    qryGrupoIniCLASSE: TStringField;
    qryGrupoIniNOME: TStringField;
    qryGrupoIniIDGRUPO: TFloatField;
    GroupBox1: TGroupBox;
    ckbCtlFisico: TCheckBox;
    ckbBaixados: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure dtedfimExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbGrupoIniExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iGrupoIni            : Integer;
    dDataMov             : tDateTime;
    sMascaraGrupo        : String;
  end;

var
  frmParamBalPatBem: TfrmParamBalPatBem;

implementation

{$R *.DFM}
uses dRelBalCaf, uSistema, uMensErro, dAtivoFixo;


procedure TfrmParamBalPatBem.FormActivate(Sender: TObject);
var
   iAux : Integer;
begin
   inherited;
   if not qryGrupoIni.Prepared then
      qryGrupoIni.Prepare;
   //-------------------------------------------------------------------------------------
   qryGrupoIni.Open;
   iGrupoIni := 0;
   //-------------------------------------------------------------------------------------
   dtmAtivoFixo.qryParamCaf.Close;
   dtmAtivoFixo.qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   dtmAtivoFixo.qryParamCaf.Open;
   sMascaraGrupo := dtmAtivoFixo.qryParamCaf.FieldByName('MASCCODGRUPO').AsString;
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   //-------------------------------------------------------------------------------------
   dtedFim.Date := date;
   dtedFim.SetFocus;
end;

procedure TfrmParamBalPatBem.dtedfimExit(Sender: TObject);
begin
   inherited;
   dDataMov := strtodate(dtedfim.Text);
end;

procedure TfrmParamBalPatBem.cmbGrupoIniExit(Sender: TObject);
begin
   inherited;
   if cmbGrupoIni.Text <> '' then
   begin
      iGrupoIni := qryGrupoIniIDGRUPO.AsInteger;
   end else
   begin
      iGrupoIni := 0;
   end;
end;

procedure TfrmParamBalPatBem.bbtnConfirmarClick(Sender: TObject);
const
   iPosSQL = 95;
var
   iAno, iMes, iDia : Word;
begin
   inherited;
   with dtmRelBalCaf do
   begin
      if qryBalPatBem.Active then
      begin
         qryBalPatBem.Filter   := '';
         qryBalPatBem.Filtered := False;
         qryBalPatBem.Close;
         if qryBalPatBem.Prepared then qryBalPatBem.UnPrepare;
      end;
      //----------------------------------------------------------------------------------
      if ckbCtlFisico.Checked then
      begin
         qryBalPatBem.SQL.Strings[iPosSQL] := ' ';
      end else
      begin
         qryBalPatBem.SQL.Strings[iPosSQL] := ' AND (B.CONTROLE = ''T'') ';
      end;
      //----------------------------------------------------------------------------------
      if ckbBaixados.Checked then
      begin
         qryBalPatBem.SQL.Strings[iPosSQL + 1] := ' ';
      end else
      begin
         qryBalPatBem.SQL.Strings[iPosSQL + 1] := ' AND (B.BAIXATOTAL <> ''S'') ';
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      DecodeDate(dtedFim.Date, iAno, iMes, iDia);
      qryBalPatBem.ParamByName('PIDPESSOA').AsFloat   := Sistema.IdEmpresa;
      qryBalPatBem.ParamByName('PDATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
      qryBalPatBem.ParamByName('PDATASLD').AsDateTime := dtedFim.Date;
      //----------------------------------------------------------------------------------
      case rdgrpDeprec.ItemIndex of
         0: begin
               qryBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
               qryBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               qryBalPatBem.ParamByName('PDEPREC').AsInteger    := 1;
               qryBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               qryBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
               qryBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
      else  begin
               qryBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
               qryBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      if not qryBalPatBem.Prepared then qryBalPatBem.Prepare;
      qryBalPatBem.Open;
      //----------------------------------------------------------------------------------
      if (iGrupoIni <> 0) then
      begin
         qryBalPatBem.Filtered := False;
         qryBalPatBem.Filter   :='IDGRUPO = '+IntToStr(iGrupoIni);
         qryBalPatBem.Filtered := True;
      end else
      begin
         qryBalPatBem.Filter   := '';
         qryBalPatBem.Filtered := False;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      dtmRelBalCaf.rpBalPatBemLabel3.Text := dtedFim.Text;
      if qryBalPatBem.IsEmpty then
         MsgDlg('Não existem dados com os parâmetros fornecidos!','Erro',mtError,[mbOk],0);
   end;
end;

end.
