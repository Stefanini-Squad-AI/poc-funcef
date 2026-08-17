unit FImpEtiq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TB97Ctls, FSairAjuda, MontaSelect,
  checklst, wwdblook, CMDBLookupCombo, Db, DBTables,
  wwQuery, ppProd, ppClass, ppReport, Wwdatsrc, ppComm, ppCache, ppDB,
  ppDBBDE, ppTypes, ppBands, ppRelatv, ppDBPipe, ImgList, uCmTypes, fPreview;

type
  TFrmImpEtiq = class(TfrmSairAjuda)
    MsPessoa: TMontaSelect;
    QryModelo: TwwQuery;
    QryModeloIDETIQUETA: TFloatField;
    QryModeloMODELOETIQ: TStringField;
    QryModeloIDREPORTS: TFloatField;
    QryModeloORIGEMCM: TFloatField;
    ppConsulta: TppBDEPipeline;
    DsConsulta: TwwDataSource;
    QrySql: TwwQuery;
    qryReports: TwwQuery;
    qryReportsTEMPLATE: TBlobField;
    Label3: TLabel;
    ToolbarButton971: TToolbarButton97;
    ToolbarButton972: TToolbarButton97;
    Label1: TLabel;
    Label2: TLabel;
    CmbModeloEtiq: TCMDBLookupCombo;
    EdtTexto: TEdit;
    CkbMatricial: TCheckBox;
    RgEnd: TRadioGroup;
    Label4: TLabel;
    CmbPessoa: TComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RptEtiq: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    procedure FormCreate(Sender: TObject);
    procedure ToolbarButton971Click(Sender: TObject);
    procedure ToolbarButton972Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sSqlEtiq: String;
    aRptMemoryStream :TMemoryStream;
  public
    { Public declarations }
  end;

var
  FrmImpEtiq: TFrmImpEtiq;

implementation

Uses
  uMensErro, uModeloRelatCM, uEtiquetaCm, uSistema;

{$R *.DFM}

procedure TFrmImpEtiq.FormCreate(Sender: TObject);
Var
  X: Integer;
begin
  inherited;
  aRptMemoryStream := TMemoryStream.Create;
  QryModelo.Open;

  CmbPessoa.Clear;

  For X:=0 To 42 Do
  Begin
     CmbPessoa.Items.Add(ListaSubTipo[TSubTipo(X)].Caption)
  End;
end;

procedure TFrmImpEtiq.ToolbarButton971Click(Sender: TObject);
begin
  inherited;
  MsPessoa.Filtro.Clear;
  MsPessoa.Filtro.Add('ENDPESS.IDPESSOA = PESSOA.IDPESSOA');

  Case RgEnd.ItemIndex of
     0: MsPessoa.Filtro.Add('(ENDPESS.IDENDERECO(+) = PESSOA.IDENDCOMERCIAL)');
     1: MsPessoa.Filtro.Add('(ENDPESS.IDENDERECO(+) = PESSOA.IDENDRESIDENCIAL)');
     2: MsPessoa.Filtro.Add('(ENDPESS.IDENDERECO(+) = PESSOA.IDENDENTREGA)');
     3: MsPessoa.Filtro.Add('(ENDPESS.IDENDERECO(+) = PESSOA.IDENDCOBRANCA)');
  End;

  MsPessoa.Tabelas.Clear;
  MsPessoa.Tabelas.Add('PESSOA');
  MsPessoa.Tabelas.Add('ENDPESS');
  MsPessoa.Tabelas.Add('CIDADES');
  MsPessoa.Tabelas.Add('ESTADO');
  MsPessoa.Tabelas.Add(ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].Tabela);

  MsPessoa.Filtro.Add('PESSOA.IDPESSOA = ' + ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].Tabela + '.' +  ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].CampoId);
  MsPessoa.Filtro.Add('ENDPESS.IDPESSOA = PESSOA.IDPESSOA');
  MsPessoa.Filtro.Add('ENDPESS.IDCIDADES = CIDADES.IDCIDADES(+)');
  MsPessoa.Filtro.Add('ESTADO.IDESTADO(+) = CIDADES.IDESTADO');

  If MsPessoa.Executar = MrOk Then
     sSqlEtiq := MsPessoa.Text
  Else
     sSqlEtiq := '';
end;

procedure TFrmImpEtiq.ToolbarButton972Click(Sender: TObject);
begin
  inherited;
  If CmbPessoa.ItemIndex = 0 Then
     MsgDlg('Favor informar o tipo a ser impresso','Atenção',MtInformation,[MbOk],0)
  Else
  Begin
     If CmbModeloEtiq.Text = ''  Then
        MsgDlg('Favor informar o modelo de etiqueta','Atenção',MtInformation,[MbOk],0)
     Else
     Begin
       RptEtiq.Reset;
       RptEtiq.ResetDevices;

       If QrySql.Active Then QrySql.Close;

       If sSqlEtiq = '' Then
       Begin
          sSqlEtiq := 'SELECT ' +
                      ' PESSOA.RAZAOSOCIAL As NOME, ' +
                      ' PESSOA.NOME AS NOMEFANTASIA, ' +
                      ' ENDPESS.LOGRADOURO As LOGRADOURO, ' +
                      ' ENDPESS.NUMERO As NUMERO, ' +
                      ' ENDPESS.COMPLEMENTO  As COMPLEMENTO, ' +
                      ' ENDPESS. BAIRRO AS BAIRRO, ' +
                      ' C.NOME AS CIDADE, ' +
                      ' ES.CODESTADO AS CODESTADO, ' +
                      ' ENDPESS.CEP AS CEP, ' +
                      ' PESSOA.IDPESSOA AS C9 ' +
                      'FROM ' +
                      ' PESSOA, ENDPESS, CIDADES C, ESTADO ES, ' + ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].Tabela +  '  ' +
                      'WHERE ' +
                      '( ENDPESS.IDPESSOA = PESSOA.IDPESSOA )  ' +
                      ' AND (ENDPESS.IDCIDADES = C.IDCIDADES(+)) '+
                      ' AND (ES.IDESTADO(+) = C.IDESTADO)  ';

          Case RgEnd.ItemIndex of
            0: sSqlEtiq := sSqlEtiq + ' AND (ENDPESS.IDENDERECO(+) = PESSOA.IDENDCOMERCIAL)';
            1: sSqlEtiq := sSqlEtiq + ' AND (ENDPESS.IDENDERECO(+) = PESSOA.IDENDRESIDENCIAL)';
            2: sSqlEtiq := sSqlEtiq + ' AND (ENDPESS.IDENDERECO(+) = PESSOA.IDENDENTREGA)';
            3: sSqlEtiq := sSqlEtiq + ' AND (ENDPESS.IDENDERECO(+) = PESSOA.IDENDCOBRANCA)';
          End;

          sSqlEtiq := sSqlEtiq + ' AND PESSOA.IDPESSOA = ' + ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].Tabela + '.' +  ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].CampoId;
       End;

       QrySql.Sql.Text := sSqlEtiq;
       QrySql.Open;

       If CkbMatricial.Checked Then
       Begin
          EtiquetaCm := TEtiquetaCm.Create;
          EtiquetaCm.ModeloEtiq := StrToInt(CmbModeloEtiq.LookupValue);
          EtiquetaCm.Imprime(QrySql,EdtTexto.Text);
          EtiquetaCm.Free;
       End
       Else
       Begin
          qryReports.Close;
          If Not qryReports.Prepared Then qryReports.Prepare;
          qryReports.Params[0].AsInteger := QryModeloIDREPORTS.AsInteger;
          qryReports.Params[1].AsInteger := QryModeloORIGEMCM.AsInteger;
          qryReports.Open;

          aRptMemoryStream.Clear;
          qryReportsTemplate.SaveToStream(aRptMemoryStream);

          qryReports.Close;

          RptEtiq.ModalPreview := False;

          aRptMemoryStream.Position := 0;
          RptEtiq.Template.LoadFromStream(aRptMemoryStream);

          RptEtiq.DataPipeline := ppConsulta;
          RptEtiq.Device := dvScreen;
          RptEtiq.ModalPreview := True;

          TFrmPreview.CreateModalPreview(Application, RptEtiq, 'Etiquetas para ' + CmbPessoa.Text);

          sSqlEtiq := '';
       End;
     End;
  End;
end;

procedure TFrmImpEtiq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If QrySql.Active Then QrySql.Close;
  inherited;
  aRptMemoryStream.Free;
end;

end.


