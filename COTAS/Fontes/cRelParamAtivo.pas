unit cRelParamAtivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  TB97, ExtCtrls, uCtrlParametros, dRelParamAtivo, dBaseDados,
  uSistema, uMensErro, fcCombo, fcColorCombo, ComCtrls, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, wwdblook, CMDBLookupCombo, Db, DBClient,
  uCMClientDataSet;

type
  TcfgRelParamAtivo = class(TcfgRel)
    rdgTipoMov: TRadioGroup;
    rdgAtivo: TRadioGroup;
    GroupBox1: TGroupBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    chkLinhas: TCheckBox;
    Panel1: TPanel;
    pgcFiltros: TPageControl;
    pgEmprestimo: TTabSheet;
    pgImobiliario: TTabSheet;
    pgInvestimento: TTabSheet;
    cmbEvento: TwwDBComboBox;
    Label1: TLabel;
    cboModulo: TCMDBLookupCombo;
    Label2: TLabel;
    cboTipoInvest: TCMDBLookupCombo;
    Label3: TLabel;
    CdsModulo: TCMClientDataSet;
    CdsTipoInvest: TCMClientDataSet;
    CdsModuloIDMODULO: TFloatField;
    CdsModuloNOMEMODULO: TStringField;
    CdsModuloDESCRICAOMODULO: TStringField;
    CdsTipoInvestIDTIPOINVEST: TFloatField;
    CdsTipoInvestDESCTIPOINVEST: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rdgAtivoClick(Sender: TObject);
  private
    { Private declarations }
    CtrlParametros : TCtrlParametros;


    procedure MensErroMt (sMsgInfo: string);




  public
    { Public declarations }
  end;

var
  cfgRelParamAtivo: TcfgRelParamAtivo;

implementation

{$R *.DFM}

procedure TcfgRelParamAtivo.FormCreate(Sender: TObject);
begin
  CtrlParametros :=  TCtrlParametros.Create;
  CtrlParametros.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                             MensErroMT);

  CdsModulo.Data     := CtrlParametros.ListaModulos;
  CdsTipoInvest.Data := CtrlParametros.ListaTipoInvest;


  inherited;

end;

procedure TcfgRelParamAtivo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlParametros);
end;

procedure TcfgRelParamAtivo.bbtnConfirmarClick(Sender: TObject);
var
sParametro: string;
iIdFiltro : integer;

begin
  inherited;


  case rdgTipoMov.ItemIndex of
    0: sParametro := '= ''R''';
    1: sParametro := '= ''C''';
    2: sParametro := '= ''N''';
    3: sParametro := 'IN (''R'',''C'',''N'')';
    4: sParametro := ' IS NULL '; 
  end;

  //  Insere a cor do marcador de texto
  if chkCorLinha.Checked then
    dtmRelParamAtivo.cCorZebra := cboCorLinha.SelectedColor
  else
    dtmRelParamAtivo.cCorZebra := clWhite;

  //  Insere linha separadora
  if chkLinhas.Checked then
    dtmRelParamAtivo.ppLinhaSepar.Visible := true
  else
    dtmRelParamAtivo.ppLinhaSepar.Visible := false;

 


  case rdgAtivo.ItemIndex of
//==============================================================================
    //  Filtra a qry para o Empréstimo
    0:  begin
          if cmbEvento.Text <> '' then
            iIdFiltro := cmbEvento.ItemIndex
          else
            iIdFiltro := -1;

          dtmRelParamAtivo.CdsParamAtivo.Data           := CtrlParametros.ListaItemXTipoContr(0,0,-1,-1,iIdFiltro,sParametro);
          dtmRelParamAtivo.ppDbAumDim.DataField         := 'DECITEMEVTO';
          dtmRelParamAtivo.ppDbDescAtivo.DataField      := 'TCEDESCRICAO';
          dtmRelParamAtivo.ppDbDescOperacao.DataField   := 'DESCEVENTO';
          dtmRelParamAtivo.ppDbDescItemEmptmo.DataField := 'ITEDESCRICAO';
          dtmRelParamAtivo.ppLbAtivo.Caption            := 'Empréstimo';
          dtmRelParamAtivo.ppLbDescAtivo.Caption        := 'Tipo de Contrato';
          dtmRelParamAtivo.ppLbDescOperacao.Caption     := 'Evento';
          dtmRelParamAtivo.ppLbDescItemEmptmo.Caption   := 'Items de Empréstimo';
        end;





//==============================  IMOBILIARIO  =================================
    //  Filtra a qry para o Imobiliário
    // e parametriza o relatório
    1: begin
         if cboModulo.Text <> '' then
           iIdFiltro := CdsModuloIDMODULO.AsInteger
         else
           iIdFiltro := -1;

         dtmRelParamAtivo.CdsParamAtivo.Data           := CtrlParametros.ListaTipoCustorecImov(-1,iIdFiltro,-1,sParametro);
         dtmRelParamAtivo.ppDbAumDim.DataField         := 'RECCUSTO';
         dtmRelParamAtivo.ppDbDescAtivo.DataField      := 'DESCMODULO';
         dtmRelParamAtivo.ppDbDescOperacao.DataField   := 'DESCCUSTORECIMO';
         dtmRelParamAtivo.ppDbDescItemEmptmo.DataField := '';
         dtmRelParamAtivo.ppLbAtivo.Caption            := 'Imobiliário';
         dtmRelParamAtivo.ppLbDescAtivo.Caption        := 'Tipo de Módulo';
         dtmRelParamAtivo.ppLbDescOperacao.Caption     := 'Módulo';
         dtmRelParamAtivo.ppLbDescItemEmptmo.Caption   := '';
       end;




//==============================  INVESTIMENTO  ================================
    //  Filtra a qry para o Investimento
    // e parametriza o relatório
    2: begin
         if cboTipoInvest.Text <> '' then
           iIdFiltro := CdsTipoInvestIDTIPOINVEST.AsInteger
         else
           iIdFiltro := -1;

         dtmRelParamAtivo.CdsParamAtivo.Data           := CtrlParametros.ListaTipoOperFiltrado(-1,iIdFiltro,sParametro);
         dtmRelParamAtivo.ppDbAumDim.DataField         := 'FLGCOTA';
         dtmRelParamAtivo.ppDbDescAtivo.DataField      := 'DESCTIPOINVEST';
         dtmRelParamAtivo.ppDbDescOperacao.DataField   := 'DESCTIPOOPERACAO';
         dtmRelParamAtivo.ppDbDescItemEmptmo.DataField := '';
         dtmRelParamAtivo.ppLbAtivo.Caption            := 'Investimento';
         dtmRelParamAtivo.ppLbDescAtivo.Caption        := 'Tipo de Investimento';
         dtmRelParamAtivo.ppLbDescOperacao.Caption     := 'Tipo de Operação';
         dtmRelParamAtivo.ppLbDescItemEmptmo.Caption   := '';
       end;
  end;


end;






procedure TcfgRelParamAtivo.MensErroMt(sMsgInfo: string);
begin
 //forma a mensagem de erro
  MsgDlg(sMsgInfo, Sistema.NomeAplicativo, mtWarning,[mbOk],0);
end;

procedure TcfgRelParamAtivo.rdgAtivoClick(Sender: TObject);
begin
  inherited;

  case  rdgAtivo.ItemIndex of
    0:  pgcFiltros.ActivePage := pgEmprestimo;   // Empréstimo
    1:  pgcFiltros.ActivePage := pgImobiliario;  // Imobiliário
    2:  pgcFiltros.ActivePage := pgInvestimento; // Investimento
  end;  
end;

end.
