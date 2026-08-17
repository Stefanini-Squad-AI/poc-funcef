unit FCadEmissBancariaMT;

interface
                                      
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlIntBanco,
  Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, Wwdbspin, uctrlPadroes, FOkCancelar, uCmFileUtils, ShellAPI, uMensErro;

type
  TFrmCadEmissBancariaMT = class(TFrmOKCancelar)
    wwDBGrid1: TwwDBGrid;
    CMSqlParams1: TCMSqlParams;
    grbFiltros: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    spEdLoteIni: TwwDBSpinEdit;
    lblLoteIni: TLabel;
    spEdLoteFin: TwwDBSpinEdit;
    lblLoteFinal: TLabel;
    Panel3: TPanel;
    dtpkIni: TCMDateTimePicker;
    lblDataIni: TLabel;
    dtPkFim: TCMDateTimePicker;
    lblDataFinal: TLabel;
    Panel4: TPanel;
    lblModulo: TLabel;
    dblkModulo: TwwDBLookupCombo;
    sqlModulo: TCMSqlParams;
    cdsModulo: TCMClientDataSet;
    Cds: TCMClientDataSet;
    ds: TwwDataSource;
    CMSqlParams2: TCMSqlParams;
    CMClientDataSet1: TCMClientDataSet;
    CMSqlParams3: TCMSqlParams;
    spbtnSelecionar: TSpeedButton;
    spbtnExcluir: TSpeedButton;
    spbtnVisualizar: TSpeedButton;
    CdsFLGEXCLUI: TStringField;
    CdsIDEMISSBANCARIA: TFloatField;
    CdsNUMLOTE: TFloatField;
    CdsQTDDOCS: TFloatField;
    CdsDATAEMISSAO: TDateTimeField;
    CdsNOMEARQ: TStringField;
    CdsVALOR: TFloatField;
    CdsIDIMAGEM: TFloatField;
    CdsIDMODULO: TFloatField;
    CdsIMAGEM: TBlobField;
    CdsNOMEMODULO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbtnSelecionarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure spbtnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlIntBanco : TCtrlIntBanco;
  public
    { Public declarations }
  end;

var
  FrmCadEmissBancariaMT: TFrmCadEmissBancariaMT;

implementation

{$R *.DFM}


procedure TFrmCadEmissBancariaMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIntBanco := TCtrlIntBanco.Create;
  CtrlIntBanco.Initializeas(padroes);
  cds.Data := CtrlIntBanco.ListaEmissBancaria(0);
  sqlModulo.Open;
  dtpkIni.Date := Date;
  dtPkFim.Date := Date;
end;


procedure TFrmCadEmissBancariaMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CtrlIntBanco.Free;
end;


procedure TFrmCadEmissBancariaMT.spbtnSelecionarClick(Sender: TObject);
begin
  inherited;
  cds.Data := CtrlIntBanco.ListaEmissBancaria(-1, dtpkIni.Date, dtPkFim.Date,
                                              trunc(spEdLoteIni.Value), trunc(spEdLoteFin.Value),
                                              strToIntDef(dblkModulo.LookupValue, -1) );
  spbtnVisualizar.Enabled := not cds.IsEmpty;
  spbtnExcluir.Enabled    := not cds.IsEmpty;
end;



procedure TFrmCadEmissBancariaMT.sbtnApagarClick(Sender: TObject);
var codigoRet: integer;
begin
  inherited;
  cds.DisableControls;
  codigoRet := -1;
  try
    cds.First;
    while not cds.eof do
    begin
      if cds.fieldByName('FLGEXCLUI').asString = 'S' then
        if not CtrlIntBanco.ExcluiEmissBancaria(cds.fieldByName('IDEMISSBANCARIA').asInteger, codigoRet) then
        begin
          if codigoRet = 1 then
          begin
            if (MsgDlg(CtrlIntBanco.MessageInfo, 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mryes) then
              if not CtrlIntBanco.ExcluiEmissBancaria(cds.fieldByName('IDEMISSBANCARIA').asInteger, codigoRet, true) then
                raise Exception.Create('Não foi possível excluir a emissão bancária: '+ CtrlIntBanco.MessageInfo);
          end
          else
          begin
            MsgDlg('Não foi possível excluir a emissão bancária: '+ CtrlIntBanco.MessageInfo, 'Erro', mtError, [mbOk], 0);
            break;
          end;  
        end;
      cds.Next;
    end;
  finally
    cds.Data := CtrlIntBanco.ListaEmissBancaria(-1, dtpkIni.Date, dtPkFim.Date,
                                                trunc(spEdLoteIni.Value), trunc(spEdLoteFin.Value),
                                                strToIntDef(dblkModulo.LookupValue, -1) );
    cds.EnableControls;
    spbtnVisualizar.Enabled := not cds.IsEmpty;
    spbtnExcluir.Enabled    := not cds.IsEmpty;
  end;
end;

procedure TFrmCadEmissBancariaMT.spbtnVisualizarClick(Sender: TObject);
var sNomeArquivo: string;
begin
  inherited;
  {adicionado a extensão .txt tpara poder abrir através do notepad}
  sNomeArquivo := cmGetTempPath() + ExtractFileName(Cds.FieldByName( 'NOMEARQ' ).AsString) + '.txt';
  If FileExists( sNomeArquivo ) Then
    DeleteFile( sNomeArquivo );
  TBlobField( Cds.FieldByName( 'IMAGEM' ) ).SaveToFile( sNomeArquivo );

  ShellExecute( Handle,
                'Open',
                pchar(sNomeArquivo),
                Nil,
                Nil,
                sw_shownormal );
end;

end.
