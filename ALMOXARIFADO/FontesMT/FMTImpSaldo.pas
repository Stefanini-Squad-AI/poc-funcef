{--------------------------------------------------------------------------------
------------------------ ALTERAÇÕES / IMPLEMENTAÇÕES ---------------------------
--------------------------------------------------------------------------------
Rotina ......: FormCreate e CmeCadastroFind
SOL..........: 163982/6901
Kintana......: 1472467
Data.........: 01/11/2011
Responsável..: Vinicius Eduardo Nascimento Maciel
Descrição....: Foi alterada esta rotina para que o combo Box Atividade/
               Projeto retorne apenas as atividades analiticas e Ativas.
--------------------------------------------------------------------------------}

unit FMTImpSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, TREdit, Mask, DBCtrls, Grids, Wwdbigrd, Wwdbgrid,
  uCtrlImplantaSaldo, uCtrlUnidNegocio, uCmTypes;


type
  TFrmMTImpSaldo = class(TFrmCadastroMT)
    Grp: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GrpArt: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbCodArt: TDBEdit;
    edDesc: TDBEdit;
    edSaldo: TDBRealEdit;
    edCustoMed: TDBRealEdit;
    edUN: TDBEdit;
    edValUltCompra: TDBRealEdit;
    dblcAtiv: TwwDBLookupCombo;
    dbGrd: TwwDBGrid;
    cdsUnidNegoc: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    ImplantaSaldo : TCtrlImplantaSaldo;
    UnidNegocio   : TCtrlUnidNegocio;

    Procedure Sel( S : String );

  public
    { Public declarations }
  end;

var
  FrmMTImpSaldo: TFrmMTImpSaldo;

implementation

{$R *.DFM}

Uses uSistema, DBaseDados, uModulo, uMensErro;

procedure TFrmMTImpSaldo.FormCreate(Sender: TObject);
begin
  inherited;
  ImplantaSaldo := TCtrlImplantaSaldo.Create;
  ImplantaSaldo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);


  UnidNegocio := TCtrlUnidNegocio.Create;
  UnidNegocio.InitializeAs( ImplantaSaldo );

  //Vinicius Maciel - SOL 163982/6901 KTN 1472467
  //cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocio(Sistema.IdEmpresa);
  cdsUnidNegoc.Data := UnidNegocio.ListaUnidNegocioAtivas(Sistema.IdEmpresa);
  //Vinicius Maciel - SOL 163982/6901 KTN 1472467 - FIM
  Sel('');
end;

procedure TFrmMTImpSaldo.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  If Not sbtnAlterar.Down Then
     dbGrd.BringToFront
  Else
     dbGrd.SendToBack;
end;

procedure TFrmMTImpSaldo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
    edSaldo.SetFocus;
end;

procedure TFrmMTImpSaldo.FormShow(Sender: TObject);
begin
  inherited;
  dbGrd.BringToFront;
end;

procedure TFrmMTImpSaldo.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := ImplantaSaldo.implantarSaldo(Sistema.IdEmpresa,
                                         edSaldo.Value,
                                         (edSaldo.Value * edCustoMed.Value),
                                         Modulo.iCodCusteio,
                                         Modulo.iCodAlmoxa,
                                         Cds.FieldByName('CODARTIGO').AsString,
                                         Cds.FieldByName('CODMEDCUSTO').AsString,
                                         Modulo.sCCustoAlmoxa,
                                         StrToIntDef(dblcAtiv.LookupValue,-1),
                                         edValUltCompra.Value);
end;

procedure TFrmMTImpSaldo.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(ImplantaSaldo.MessageInfo,'Erro',MtError,[mbOk],0);
end;

procedure TFrmMTImpSaldo.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  cds.Next;
end;

procedure TFrmMTImpSaldo.Sel(S: String);
begin
  Cds.Data := ImplantaSaldo.ListImpSaldo(Modulo.iCodAlmoxa, s );
  TFloatField(Cds.FieldByName('VALULTCOMPRA')).DisplayFormat := '#,##0.00';
  TFloatField(Cds.FieldByName('SALDOQTDEMOV')).DisplayFormat := '#,#####0.00000';
  TFloatField(Cds.FieldByName('CUSTOMEDIOMOV')).DisplayFormat := '#,##0.00';
end;

procedure TFrmMTImpSaldo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  begin
     Sel(MontaSelect.ValoresChave[0]);
     //Vinicius Maciel - SOL 163982/6901 KTN 1472467
     if((dblcAtiv.Text = '') and (dblcAtiv.LookupValue <> '')) then
     dblcAtiv.Text := UnidNegocio.recuperaAtividadePerd(dblcAtiv.LookupValue)
     //Vinicius Maciel - SOL 163982/6901 KTN 1472467 - FIM
  end;
end;

procedure TFrmMTImpSaldo.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;

end;

procedure TFrmMTImpSaldo.bbtnConfirmarClick(Sender: TObject);
begin
  If Cds.State in dsEditModes Then
     Cds.Post;
  inherited;
  sbtnAlterar.Click;
end;

end.



