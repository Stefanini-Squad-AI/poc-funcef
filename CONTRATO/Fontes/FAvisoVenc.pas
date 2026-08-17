unit FAvisoVenc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Wwdatsrc;

type
  TfrmAvisoVenc = class(TfrmSairAjuda)
    qryContrato: TwwQuery;
    dbgContrato: TwwDBGrid;
    qryContratoIDCONTRATO: TFloatField;
    qryContratoNOMECONTRATO: TStringField;
    qryContratoDATAPREVENCERRA: TDateTimeField;
    qryContratoAVISO: TFloatField;
    qryContratoDATAAVISO: TDateTimeField;
    qryContratoFLGFIMCONTRATO: TStringField;
    dsContrato: TwwDataSource;
    qryContratoDIASFALTAM: TFloatField;
    qryAditamento: TwwQuery;
    dsAditamento: TwwDataSource;
    upAditamento: TUpdateSQL;
    qryAditamentoIDCONTRATO: TFloatField;
    qryAditamentoIDADITAMENTO: TFloatField;
    qryAditamentoDATAASSADITAMENTO: TDateTimeField;
    qryAditamentoDESCADITAMENTO: TMemoField;
    qryAditamentoFLGVIRTUAL: TStringField;
    qryAditamentoTRGDTINCLUSAO: TDateTimeField;
    qryAditamentoTRGUSERINCLUSAO: TStringField;
    qryAditamentoCODADITAMENTO: TStringField;
    qryAditamentoIDPROCESSO: TFloatField;
    qryContratoIDTIPOPROCESSORAD: TFloatField;
    qryContratoCODCENTRORESPON: TStringField;
    qryContratoUNIDNEGOC: TFloatField;
    qryContratoFLGOK: TStringField;
    qryContratoIDPROCESSO: TFloatField;
    qryContratoOBS: TStringField;
    bbtnIniciarRenovacao: TBitBtn;
    bbtnProcessoRenovacao: TmaHelpBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure dbgContratoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnProcessoRenovacaoClick(Sender: TObject);
    procedure bbtnIniciarRenovacaoClick(Sender: TObject);
    procedure qryContratoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvisoVenc: TfrmAvisoVenc;

implementation

{$R *.DFM}
uses uSistema,uDataBase,uRAD,UMensErro,FMTAcompProc;

procedure TfrmAvisoVenc.FormCreate(Sender: TObject);
begin
  inherited;
  qryContrato.Close;
  qryContrato.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryContrato.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryContrato.Open;
end;

procedure TfrmAvisoVenc.dbgContratoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
   //Faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then begin
      if not Highlight then begin
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.color := clwhite
         end else begin
            ABrush.Color := $00C0FFFF; //Amarelo Bebê
         end;
      end;
   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;

procedure TfrmAvisoVenc.bbtnIniciarRenovacaoClick(Sender: TObject);
var
   Rad         : Trad;
   nIDProcesso : Real;
begin
   Rad:=TRad.Create;
   try
      Rad.TipoProcesso    := qryContratoIDTIPOPROCESSORAD.AsInteger;
      Rad.IdPessoa        := Sistema.IdEmpresa;
      Rad.CodCentroRespon := qryContratoCODCENTRORESPON.AsString;
      Rad.UnidNegoc       := qryContratoUNIDNEGOC.AsInteger;
      Rad.OBS             := '';
      Rad.Valor           := 0;
      Rad.CodGrupoProd    := '';
      nIDProcesso:=Rad.IniciarProcesso;
   finally
      Rad.Free;
   end;

   if nIDProcesso<>0 then
    begin
       qryAditamento.Open;
       qryAditamento.Insert;
       qryAditamentoIDCONTRATO.AsFloat:=qryContratoIDCONTRATO.AsFloat;
       qryAditamentoIDADITAMENTO.AsFloat:=LeUltRegistro(nil,'ADITAMENTO');
       qryAditamentoDATAASSADITAMENTO.AsDateTime:=Now;
       qryAditamentoDESCADITAMENTO.AsString:='Renovação de Contrato';
       qryAditamentoCODADITAMENTO.AsString:='*Renovação*';
       qryAditamentoIDPROCESSO.AsFloat:=nIDProcesso;
       qryAditamento.Post;
       qryAditamento.ApplyUpdates;
       qryAditamento.CancelUpdates;
       qryAditamento.Close;
       bbtnIniciarRenovacao.Enabled:=False;

       qryContrato.Close;
       qryContrato.Open;              
    end
   else
    MsgDlg('Não foi possível iniciar o processo de Renovação de Contrato.','Erro',mtError,[mbOK],0);

end;

procedure TfrmAvisoVenc.bbtnProcessoRenovacaoClick(Sender: TObject);
begin
   with TFrmMTAcompProc.Create(Self) do
   try
      sTipoProc:='Renovação de Contrato';
      sPessoa:=Sistema.NomeEmpresa;
      sUsuario:=Sistema.NomeUsuario;
      sObs:=qryContratoOBS.AsString;
      iNumProc:=qryContratoIDPROCESSO.AsInteger;
      ShowModal;
   finally
      Free;
   end;
end;


procedure TfrmAvisoVenc.qryContratoAfterScroll(DataSet: TDataSet);
begin
   bbtnIniciarRenovacao.Enabled:= not(qryContratoIDPROCESSO.AsFloat<>0) AND
                                  (Sistema.UsaRAD);
   bbtnProcessoRenovacao.Enabled:= (qryContratoIDPROCESSO.AsFloat<>0) AND
                                      (qryContratoFLGOK.AsString<>'S') AND
                                      (Sistema.UsaRAD);
end;

end.
