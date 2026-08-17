unit fParamMovAnaPer2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,  
  TREdit, Mask, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmParamMovAnaPer2 = class(TfrmOkCancelar)
    rdgrpMovim: TRadioGroup;
    RdGrpOrdem: TRadioGroup;
    grpPeriodo: TGroupBox;
    Label2: TLabel;
    dteDataIni: TCMDateTimePicker;
    dteDataFim: TCMDateTimePicker;
    qryClasse: TwwQuery;
    qryClasseDESCRICAO: TStringField;
    qryClasseCODHIERARQ: TStringField;
    qryClasseIDCLASSEBEM: TFloatField;
    qryGrupo: TwwQuery;
    qryGrupoNOME: TStringField;
    qryGrupoCLASSE: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    qryLocalizacao: TwwQuery;
    qryLocalizacaoNOME: TStringField;
    qryLocalizacaoIDLOCALIZACAO: TFloatField;
    qryResponsavel: TwwQuery;
    qryResponsavelNOME: TStringField;
    qryResponsavelIDRESPONSAVEL: TFloatField;
    grpSelecao: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    cmbGrupo: TwwDBLookupCombo;
    cmbResponsavel: TwwDBLookupCombo;
    cmbLocalizacao: TwwDBLookupCombo;
    cmbClasse: TwwDBLookupCombo;
    cmbSituacao: TwwDBLookupCombo;
    Label3: TLabel;
    qrySituacao: TwwQuery;
    qrySituacaoIDSITUACAO: TFloatField;
    qrySituacaoDESCSITUACAO: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamMovAnaPer2: TfrmParamMovAnaPer2;

implementation

uses uSistema, dRelOperCaf,  uMensErro;

{$R *.DFM}

procedure TfrmParamMovAnaPer2.FormCreate(Sender: TObject);
begin
   inherited;
   qrySituacao.Open;
   qryClasse.Open;
   qryGrupo.Open;
   qryLocalizacao.Open;
   qryResponsavel.Open;
end;
//========================================================================================
procedure TfrmParamMovAnaPer2.FormActivate(Sender: TObject);
begin
   inherited;
   dteDataIni.SetFocus;
end;
//========================================================================================
procedure TfrmParamMovAnaPer2.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   with dtmRelOperCaf.qryMovAnaPer2 do
   begin
      Close;
      if (dteDataIni.Text <> '') then
         SQL.Strings[18] := '(HMOV.DATAMOVIMENTACAO >= TO_DATE('+#39+dteDataIni.Text+#39+','+#39+'DD/MM/YYYY'+#39+')) AND'
      else
         SQL.Strings[18] := '';
      //----------------------------------------------------------------------------------
      if (dteDataFim.Text <> '') then
         SQL.Strings[19] := '(HMOV.DATAMOVIMENTACAO <= TO_DATE('+#39+dteDataFim.Text+#39+','+#39+'DD/MM/YYYY'+#39+')) AND'
      else
         SQL.Strings[19] := '';
      //----------------------------------------------------------------------------------
      case rdgrpMovim.ItemIndex  of
         0: SQL.Strings[20] := '(HMOV.IDTIPOMOVIMENTACAO IN (01,03)) AND';
         1: SQL.Strings[20] := '(HMOV.IDTIPOMOVIMENTACAO = 06) AND';
         2: SQL.Strings[20] := '(HMOV.IDTIPOMOVIMENTACAO IN (11,12)) AND';
      end;
      //----------------------------------------------------------------------------------
      if cmbSituacao.Text <> '' then
         SQL.Strings[21] := ' (BEM.IDSITUACAO = ' + inttostr(qrySituacaoIDSITUACAO.AsInteger) + ') AND '
      else
         SQL.Strings[21] := ' ';
      //----------------------------------------------------------------------------------
      if cmbClasse.Text <> '' then
         SQL.Strings[22] := ' (BEM.IDCLASSEBEM = ' + inttostr(qryClasseIDCLASSEBEM.AsInteger) + ') AND '
      else
         SQL.Strings[22] := ' ';
      //----------------------------------------------------------------------------------
      if cmbGrupo.Text <> '' then
         SQL.Strings[23] := ' (BEM.IDGRUPO = ' + inttostr(qryGrupoIDGRUPO.AsInteger) + ') AND '
      else
         SQL.Strings[23] := ' ';
      //----------------------------------------------------------------------------------
      if cmbLocalizacao.Text <> '' then
         SQL.Strings[24] := ' (C.IDLOCALIZACAO = ' + inttostr(qryLocalizacaoIDLOCALIZACAO.AsInteger) + ') AND '
      else
         SQL.Strings[24] := ' ';
      //----------------------------------------------------------------------------------
      if cmbResponsavel.Text <> '' then
         SQL.Strings[25] := ' (C.IDRESPONSAVEL = ' + inttostr(qryResponsavelIDRESPONSAVEL.AsInteger) + ') AND '
      else
         SQL.Strings[25] := ' ';
      //----------------------------------------------------------------------------------
      case rdGrpOrdem.ItemIndex of
         0: SQL.Strings[33] := ' ORDER BY HMOV.DATAMOVIMENTACAO, BEM.DESBEM ';
         1: SQL.Strings[33] := ' ORDER BY HMOV.DATAMOVIMENTACAO, BEM.PLACA ';
         2: SQL.Strings[33] := ' ORDER BY HMOV.DATAMOVIMENTACAO, BEM.PROCESSOAQUIS ';
         3: SQL.Strings[33] := ' ORDER BY HMOV.DATAMOVIMENTACAO, BEM.IDNOTA ';
         4: SQL.Strings[33] := ' ORDER BY HMOV.DATAMOVIMENTACAO, L.NOME ';
         5: SQL.Strings[33] := ' ORDER BY HMOV.DATAMOVIMENTACAO, BEM.DESBEM ';
      end;
      ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   end;
   //-------------------------------------------------------------------------------------
   if rdgrpMovim.ItemIndex = 0 then
   begin
      dtmRelOperCaf.ppLabel119.Caption  := 'Entradas';
   end else
   if rdgrpMovim.ItemIndex = 1 then
   begin
      dtmRelOperCaf.ppLabel119.Caption  := 'Saídas';
   end else
   begin
      dtmRelOperCaf.ppLabel119.Caption  := 'Transferências';
   end;
   //-------------------------------------------------------------------------------------
   with dtmRelOperCaf do
   begin
      qryMovAnaPer2.Open;
      Screen.Cursor := crDefault;
      if qryMovAnaPer2.IsEmpty then
         MsgDlg('Não existe Movimentação de Bens no periodo fornecido.',
                'Erro',mtError,[mbOk],0);
   end;
end;
//========================================================================================
procedure TfrmParamMovAnaPer2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySituacao.Close;
   qryClasse.Close;
   qryGrupo.Close;
   qryLocalizacao.Close;
   qryResponsavel.Close;
   qrySituacao.UnPrepare;
   qryClasse.UnPrepare;
   qryGrupo.UnPrepare;
   qryLocalizacao.UnPrepare;
   qryResponsavel.UnPrepare;
end;

end.

