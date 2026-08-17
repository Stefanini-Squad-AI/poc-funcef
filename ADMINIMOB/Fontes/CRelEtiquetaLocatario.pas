unit CRelEtiquetaLocatario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcButton, fcImgBtn, fcShapeBtn, wwdblook, Db,
  DBTables, Wwquery, ppComm, ppProd, ppClass, ppReport, Wwdatsrc, ppCache,
  ppDB, ppDBBDE, ppTypes, CRel, ppRelatv, ppDBPipe, mResponsavel,
  mAdministradora;

type
  TcfgRelEtiquetaLocatario = class(TcfgRel)
    qryModeloEtiq: TwwQuery;
    qryModeloEtiqMODELOETIQ: TStringField;
    qryModeloEtiqIDETIQUETA: TFloatField;
    qryModeloEtiqIDREPORTS: TFloatField;
    qryModeloEtiqORIGEMCM: TFloatField;
    qryEtiquetasLocatario: TwwQuery;
    qryEtiquetasLocatarioIDPESSOA: TFloatField;
    qryEtiquetasLocatarioNOME: TStringField;
    qryEtiquetasLocatarioLOGRADOURO: TStringField;
    qryEtiquetasLocatarioNUMERO: TStringField;
    qryEtiquetasLocatarioCOMPLEMENTO: TStringField;
    qryEtiquetasLocatarioBAIRRO: TStringField;
    qryEtiquetasLocatarioCODESTADO: TStringField;
    qryEtiquetasLocatarioCEP: TStringField;
    qryReports: TwwQuery;
    qryReportsTEMPLATE: TBlobField;
    pplEtiquetasLocatario: TppBDEPipeline;
    dsEtiquetasLocatario: TwwDataSource;
    qryEtiquetasLocatarioCIDADE: TStringField;
    Label1: TLabel;
    btnModeloEtiqueta: TfcShapeBtn;
    DBcboEtiqueta: TwwDBLookupCombo;
    rdgContrato: TRadioGroup;
    chkMatricial: TCheckBox;
    MemReports: TMemo;
    chkFolha: TCheckBox;
    qryEtiquetasLocatarioCONTATO: TStringField;
    molResponsavel1: TmolResponsavel;
    molAdministradora1: TmolAdministradora;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnModeloEtiquetaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBcboEtiquetaDropDown(Sender: TObject);
  private
     { Private declarations }
     function  VerificaPreenchimento: boolean;
     procedure SelecionaContratosFolha;
  public
    { Public declarations }
  end;

var
  cfgRelEtiquetaLocatario: TcfgRelEtiquetaLocatario;

implementation

uses uEtiquetaCM, UComunsImobiliario, uVerificaPreenchimento, uMensErro, uFuncoesImob, uSistema,
     uDiasInUteis, dImobiliario, dLookImobiliario, uModeloRelatCM, DMS;

{$R *.DFM}

function TcfgRelEtiquetaLocatario.VerificaPreenchimento: boolean;
begin
   Result := False;
   try
      if length(DBcboEtiqueta.Text) = 0 then
         raise EValidacao.CreateVal('É necessário preencher o modelo da etiqueta!', DBcboEtiqueta);
    except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



procedure TcfgRelEtiquetaLocatario.SelecionaContratosFolha;
var
   dDataCarencia, dDataFim : tDateTime;
   day, month, year        : word;
   sSql : String;
   iPos : Integer;
begin

   DecodeDate(date,year,month,day);
   dDataFim       := EncodeDate((year), (month), 1);
   dDataCarencia  := DiasInUteis.UltDiaMes((year), month);

   // verifica o parâmetro ligado a Cobrança Automática
   ParametrosSistema;
   LimpaParametros(dtmImobiliario.qryParamImob);

   // seleciona os contratos
   with qryEtiquetasLocatario do begin

      // acha e exclui expressão "1=2 AND"
      sSql := Sql.Text;
      iPos := pos('1=2 AND', sSql);
      if iPos > 1 then begin
         System.Delete(sSql, iPos, 7);
         Sql.Text := sSql;
      end;

      LimpaParametros(qryEtiquetasLocatario);

      ParamByName('PIDPESSOA').AsInteger           := Sistema.idEmpresa;
      ParamByName('PCONDATAFIM').asDateTime        := dDataFim;
      ParamByName('PCONDATACARENCIA').asDateTime   := dDataCarencia;
      if rdgContrato.ItemIndex = 0 then
           ParamByName('PFLGTIPOCONTRATO').AsString := 'L'
      else ParamByName('PFLGTIPOCONTRATO').AsString := 'R';

      if molResponsavel1.iResponsavel > 0       then ParamByName('PIDRESPONSAVEL').AsInteger := molResponsavel1.iResponsavel;
      if molAdministradora1.iAdministradora > 0 then ParamByName('PIDADMINIMOVEL').AsInteger := molAdministradora1.iAdministradora;
      if chkFolha.Checked then      ParamByName('PFLGCOBRANCAAUTO').AsInteger    := 1;

      Open;
   end;
end;


procedure TcfgRelEtiquetaLocatario.bbtnConfirmarClick(Sender: TObject);
var RptEtiq: TppReport;
begin
   inherited;

   SelecionaContratosFolha;

   qryEtiquetasLocatario.Open;
   if VerificaPreenchimento then begin
      if chkMatricial.Checked then begin
         EtiquetaCm := TEtiquetaCm.Create;
         try
            EtiquetaCm.ModeloEtiq := qryModeloEtiqIDETIQUETA.AsInteger;
            EtiquetaCm.Imprime(qryEtiquetasLocatario,'');
         finally
            EtiquetaCm.Free;
         end;
      end else begin
         RptEtiq := TppReport.Create(Application);
         try
            LimpaParametros(qryReports);
            qryReports.ParamByName('PIDREPORTS').AsInteger := qryModeloEtiqIDREPORTS.AsInteger;
            qryReports.ParamByName('PORIGEMCM').AsInteger := qryModeloEtiqORIGEMCM.AsInteger;
            qryReports.Open;
            MemReports.Lines.Clear;
            MemReports.Lines.Text := qryReportsTEMPLATE.AsString;

            //Substitui o Pipeline do Template pelo Pipeline do Report
            ModeloRelatCM.SetaDataPipeline('FrmEtiquetasLocatario','pplEtiquetasLocatario','FrmConfigEtiq','ppEtiquetasLocatario',MemReports);
            MemReports.Lines.SaveToFile(Sistema.TempDir + ArqCmEtiqueta);
            RptEtiq.Template.FileName := Sistema.TempDir + ArqCmEtiqueta;
            RptEtiq.ModalPreview := False;
            RptEtiq.Template.LoadFromFile;
            ModeloRelatCM.SetaDadosRpt(RptEtiq,pplEtiquetasLocatario,ArqCmEtiqueta);
            RptEtiq.Device := dvScreen;
            RptEtiq.ModalPreview := True;
            RptEtiq.print;
         finally
            RptEtiq.Free;
         end;
      end;
   end;
end;

procedure TcfgRelEtiquetaLocatario.btnModeloEtiquetaClick(Sender: TObject);
begin
   inherited;
   btnModeloEtiqueta.Tag := 1;
   try
      EtiquetaCM.AbrirFormConfig;
   finally
      Repaint;
   end;
end;

procedure TcfgRelEtiquetaLocatario.FormCreate(Sender: TObject);
begin
   inherited;
   LimpaParametros(qryModeloEtiq);
   qryModeloEtiq.Open;
   molResponsavel1.btnLimpaResponsavelClick( Self );
   molAdministradora1.btnLimpaAdministradoraClick( Self );
end;

procedure TcfgRelEtiquetaLocatario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryModeloEtiq.Close;
   qryEtiquetasLocatario.Close;
end;

procedure TcfgRelEtiquetaLocatario.DBcboEtiquetaDropDown(Sender: TObject);
begin
   inherited;
   if btnModeloEtiqueta.Tag = 1 then begin
      btnModeloEtiqueta.Tag := 0;
      qryModeloEtiq.Close;
      qryModeloEtiq.Open;
   end;
end;

end.
