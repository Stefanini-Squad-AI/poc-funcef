unit FImpEtiqMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, TB97Ctls, FSairAjuda, MontaSelect,
  checklst, wwdblook, CMDBLookupCombo, Db, DBTables,
  wwQuery, ppProd, ppClass, ppReport, Wwdatsrc, ppComm, ppCache, ppDB,
  ppDBBDE, ppTypes, ppBands, ppRelatv, ppDBPipe, ImgList, uCmTypes, fPreview,
  uCmSqlParams, DBClient, uCMClientDataSet;

type
  TFrmImpEtiqMT = class(TfrmSairAjuda)
    MsPessoa: TMontaSelect;
    ppConsulta: TppBDEPipeline;
    DsConsulta: TwwDataSource;
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
    CdsConsulta: TCMClientDataSet;
    SQLConsulta: TCMSqlParams;
    SQLReports: TCMSqlParams;
    CdsReports: TCMClientDataSet;
    CdsModelo: TCMClientDataSet;
    SQLModelo: TCMSqlParams;
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
  FrmImpEtiqMT: TFrmImpEtiqMT;

implementation

Uses
  uMensErro, uModeloRelatCM, uEtiquetaCm, uSistema;

{$R *.DFM}

procedure TFrmImpEtiqMT.FormCreate(Sender: TObject);
Var
  X: Integer;
begin
  inherited;
  aRptMemoryStream := TMemoryStream.Create;
  SQLModelo.Open;

  CmbPessoa.Clear;

  For X:=0 To 42 Do
  Begin
     CmbPessoa.Items.Add(ListaSubTipo[TSubTipo(X)].Caption)
  End;
end;

procedure TFrmImpEtiqMT.ToolbarButton971Click(Sender: TObject);
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

  Case RgEnd.ItemIndex of
     0: MsPessoa.Filtro.Add('(CONTATOPESS.IDENDERECO(+) = PESSOA.IDENDCOMERCIAL)');
     1: MsPessoa.Filtro.Add('(CONTATOPESS.IDENDERECO(+) = PESSOA.IDENDRESIDENCIAL)');
     2: MsPessoa.Filtro.Add('(CONTATOPESS.IDENDERECO(+) = PESSOA.IDENDENTREGA)');
     3: MsPessoa.Filtro.Add('(CONTATOPESS.IDENDERECO(+) = PESSOA.IDENDCOBRANCA)');
  End;

  MsPessoa.Tabelas.Clear;
  MsPessoa.Tabelas.Add('PESSOA');
  MsPessoa.Tabelas.Add('ENDPESS');
  MsPessoa.Tabelas.Add('CONTATOPESS');
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

procedure TFrmImpEtiqMT.ToolbarButton972Click(Sender: TObject);
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
                      ' CP.NOME AS CONTATO, ' +
                      ' PESSOA.IDPESSOA AS C9 ' +
                      'FROM ' +
                      ' PESSOA, ENDPESS, CONTATOPESS CP, CIDADES C, ESTADO ES, ' + ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].Tabela +  '  ' +
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

          Case RgEnd.ItemIndex of
            0: sSqlEtiq := sSqlEtiq + ' AND (CP.IDENDERECO(+) = PESSOA.IDENDCOMERCIAL)';
            1: sSqlEtiq := sSqlEtiq + ' AND (CP.IDENDERECO(+) = PESSOA.IDENDRESIDENCIAL)';
            2: sSqlEtiq := sSqlEtiq + ' AND (CP.IDENDERECO(+) = PESSOA.IDENDENTREGA)';
            3: sSqlEtiq := sSqlEtiq + ' AND (CP.IDENDERECO(+) = PESSOA.IDENDCOBRANCA)';
          End;

          sSqlEtiq := sSqlEtiq + ' AND PESSOA.IDPESSOA = ' + ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].Tabela + '.' +  ListaSubTipo[TSubTipo(CmbPessoa.ItemIndex)].CampoId;
       End;

       SQLConsulta.Sql.Text := sSqlEtiq;
       SQLConsulta.Open;

       If CkbMatricial.Checked Then
       Begin
          EtiquetaCm := TEtiquetaCm.Create;
          EtiquetaCm.ModeloEtiq := StrToInt(CmbModeloEtiq.LookupValue);
          CdsConsulta.Open;
          EtiquetaCm.Imprime(CdsConsulta,EdtTexto.Text);
          EtiquetaCm.Free;
       End
       Else
       Begin
          SQLReports.Prepare;
          SQLReports.ParamByName('IDREPORTS').AsInteger := CdsModelo.FieldByName('IDREPORTS').AsInteger;
          SQLReports.ParamByName('ORIGEMCM').AsInteger := CdsModelo.FieldByName('ORIGEMCM').AsInteger;
          SQLReports.Open;

          aRptMemoryStream.Clear;
          TBlobField(CdsReports.FieldByName('TEMPLATE')).SaveToStream(aRptMemoryStream);
          CdsReports.Close;

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

procedure TFrmImpEtiqMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If CdsConsulta.Active Then CdsConsulta.Close;
  If CdsReports.Active Then CdsReports.Close;
  If CdsModelo.Active Then CdsModelo.Close;    
  inherited;
  aRptMemoryStream.Free;
end;

end.


