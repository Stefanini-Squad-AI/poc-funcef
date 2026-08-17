unit fParamCtaMovGrp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery;

type
  TfrmParamCtaMovGrp = class(TfrmOkCancelar)
    Label2: TLabel;
    edPlanoConta: TEdit;
    qryGrupo: TwwQuery;
    Label3: TLabel;
    dblckCmbGrupo: TwwDBLookupCombo;
    qryPlano: TwwQuery;
    qryPlanoPLANO: TFloatField;
    qryPlanoDESCPLANO: TStringField;
    qryPlanoMASCARA: TStringField;
    qryGrupoCLASSE: TStringField;
    qryGrupoNOME: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure dblckCmbGrupoExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sMascaraGrupo, sMascaraPlano, sMascaraCCusto : String;
    iPlano, iIdGrupo                             : Integer;

  end;

var
  frmParamCtaMovGrp: TfrmParamCtaMovGrp;

implementation

uses dAtivoFixo, dRelCadCaf, uSistema, uMensErro;

{$R *.DFM}

procedure TfrmParamCtaMovGrp.FormActivate(Sender: TObject);
Var
   iAux : Integer;

begin
   inherited;
   if not qryGrupo.Prepared then
      qryGrupo.Prepare;
   //-------------------------------------------------------------------------------------
   qryGrupo.Open;
   qryGrupo.First;
   iIdGrupo := qryGrupo.FieldByName('IDGRUPO').AsInteger;
   //-------------------------------------------------------------------------------------
   iPlano := 0;
   with dtmAtivoFixo do
   begin
      qryParamCaf.Close;
      qryParamCaf.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryParamCaf.Open;
      iPlano := qryParamCaf.FieldByName('PLANOVIGENTE').AsInteger;
      sMascaraGrupo := qryParamCaf.FieldByName('MASCCODGRUPO').AsString;
      //----------------------------------------------------------------------------------
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraGrupo := sMascaraGrupo + ';0; ';
      //----------------------------------------------------------------------------------
      qryParamGlobal.Close;
      qryParamGlobal.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryParamGlobal.Open;
      sMascaraCCusto := qryParamGlobal.FieldByName('MASCARACC').AsString;
      //----------------------------------------------------------------------------------
      iAux := 1;
      while iAux <= length(sMascaraCCusto) do
      begin
         if sMascaraCCusto[iAux] = '9' then
            sMascaraCCusto[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraCCusto := sMascaraCCusto + ';0; ';
   end;
   //-------------------------------------------------------------------------------------
   qryPlano.Close;
   qryPlano.ParamByName('PPLANO').AsInteger := iPlano;
   qryPlano.Open;
   sMascaraPlano := trim(qryPlano.FieldByName('MASCARA').AsString);
   iAux := 1;
   while iAux <= length(sMascaraPlano) do
   begin
      if sMascaraPlano[iAux] = '9' then
         sMascaraPlano[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraPlano := sMascaraPlano + ';0; ';
   edPlanoConta.Text := trim(inttostr(iPlano)) + ' - ' + qryPlanoDESCPLANO.AsString;
   edPlanoConta.Enabled := False;
   qryPlano.Close;
   //-------------------------------------------------------------------------------------
   dblckCmbGrupo.SetFocus;
end;
//========================================================================================
procedure TfrmParamCtaMovGrp.dblckCmbGrupoExit(Sender: TObject);
begin
   inherited;
   if dblckCmbGrupo.Text <> '' then
      iIdGrupo := qryGrupoIDGRUPO.AsInteger
   else
      iIdGrupo := 0;
end;
//========================================================================================
procedure TfrmParamCtaMovGrp.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   with dtmRelCadCaf.qryParamCAFxContab do
   begin
      Close;
      if iIdGrupo <> 0 then
         SQL.Strings[11] := ' AND (TMG.IDGRUPO = ' + IntToStr(iIdGrupo) + ') '
      else
         SQL.Strings[11] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   dtmRelCadCaf.rpCtaMovGrpDBText2.DisplayFormat := sMascaraGrupo;
   dtmRelCadCaf.rpCtaMovGrpDBText4.DisplayFormat := sMascaraPlano;
   dtmRelCadCaf.rpCtaMovGrpDBText7.DisplayFormat := sMascaraCCusto;
   dtmRelCadCaf.rpCtaMovGrpPlanoConta.Caption    := 'Plano de Conta ' + edPlanoConta.Text;
   //-------------------------------------------------------------------------------------
   with dtmRelCadCaf do
   begin
      qryParamCAFxContab.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa; 
      qryParamCAFxContab.Open;
      if qryParamCAFxContab.IsEmpty then
         MsgDlg('Não há Parametrização Contábil definida para os paramêtros informados!',
                'Erro',mtError,[mbOk],0);
   end;
end;

procedure TfrmParamCtaMovGrp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryGrupo.Close;
   dtmAtivoFixo.qryParamCAF.Close;
   dtmAtivoFixo.qryParamGlobal.Close;
end;

end.
