unit dRelatorios;

interface

uses ivDictio, 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TdtmRelatorios = class(TdtmReports)
    pplUsuario: TppBDEPipeline;
    DsUsuario: TwwDataSource;
    QryUsuario: TwwQuery;
    rpUsuario: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    LblTitulo: TppLabel;
    ppLabel4: TppLabel;
    LblDescricao: TppLabel;
    LblNome: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    LblTitMembro: TppLabel;
    pplGrupo: TppBDEPipeline;
    DsGrupo: TwwDataSource;
    QryGrupo: TwwQuery;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel9: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    pplTabela: TppBDEPipeline;
    DsTabela: TwwDataSource;
    QryTabela: TwwQuery;
    pplDataview: TppBDEPipeline;
    DsDataview: TwwDataSource;
    QryDataview: TwwQuery;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel16: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    QryTabelaTABLE_NAME: TStringField;
    QryTabelaCOLUMN_NAME: TStringField;
    QryDataviewNAME: TStringField;
    pplDireito: TppBDEPipeline;
    DsDireito: TwwDataSource;
    QryDireito: TwwQuery;
    QryDireitoNOMEOPERACAO: TStringField;
    QryDireitoNOMEFUNCAO: TStringField;
    ppSubReport4: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel26: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    DbtNomeMembro: TppDBText;
    DbtDescrMembro: TppDBText;
    ppLabel5: TppLabel;
    DbtNomeVisao: TppDBText;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    DbtTabela: TppDBText;
    DbtColuna: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function MostraParam( Form: String ): Boolean; Override;
  end;

var
  dtmRelatorios: TdtmRelatorios;

implementation

uses fRelAcesso;

{$R *.DFM}

Function TdtmRelatorios.MostraParam( Form: String ): Boolean; 
var
  Frm: TForm;
  bTemParam: Boolean;
Begin
   bTemParam := True;
   
   If UpperCase( Form ) = 'FRMRELACESSO'{ivlm} Then
      frm := TFrmRelAcesso.Create( Application )
   Else
      frm := Nil;

   If frm = Nil Then Begin
      Result := Not bTemParam;
      Exit;
   End;

   With Frm Do Begin
      Result := ( ShowModal = mrOk );
      Free;
   end;
End;

procedure TdtmRelatorios.ppHeaderBand1BeforePrint(Sender: TObject);
begin
  inherited;
  With frmRelAcesso Do Begin
       If CbGrupo.ItemIndex <> 0 Then Begin
          LblTitulo.Caption    := Translate('Grupo:');
          LblNome.Caption      := slGrupo[ CbGrupo.ItemIndex ];
          LblDescricao.Caption := slDescrGrp[ CbGrupo.ItemIndex ];
          LblTitMembro.Caption    := Translate('Usuários cadastrados');
          DbtNomeMembro.DataField := 'NOMEUSUARIO'{ivlm};
          DbtNomeMembro.DataField := 'DESCRICAO'{ivlm};
       End Else Begin
          LblTitulo.Caption    := Translate('Usuário:');
          LblNome.Caption      := slUsuario[ CbUsuario.ItemIndex ];
          LblDescricao.Caption := slDescrUsr[ CbUsuario.ItemIndex ];
          LblTitMembro.Caption    := Translate('Grupos Cadastrados');
          DbtNomeMembro.DataField := 'NOMEGRUPO'{ivlm};
          DbtNomeMembro.DataField := 'DESCRICAO'{ivlm};
       End;
  End;
end;

end.
