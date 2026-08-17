{===============================================================================
Analista : Marcus Oliveira
Pendência: 23848
Data: 10/11/2006
Descrição: Tela de parametros, Relatório sintético e pendente do RAD.
===============================================================================}

unit FParamRPTProcessoRad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, uCtrlpadroes,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti, FTelaAut, uCtrlRADPlus,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, FConsultaRAD, uCtrlRptRadG, 
  uSistema, JCLSysUtils, Db, DBClient, uCMClientDataSet;

type
  TfrmParamRPTProcessoRAD = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    chkAtraso: TCheckBox;
    chkEmDia: TCheckBox;
    GroupBox2: TGroupBox;
    chkSubstituto: TCheckBox;
    chkTerceiros: TCheckBox;
    cdsRAD: TCMClientDataSet;
    gbOrdena: TGroupBox;
    cbOrdenacao: TComboBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    frmConsultaRAD: TFrmConsultaRad;
    strIni : TStringList;
    procedure GravaIni;
    procedure LeIni;


  public
    { Public declarations }
  end;

var
  frmParamRPTProcessoRAD: TfrmParamRPTProcessoRAD;

implementation

{$R *.DFM}

procedure TfrmParamRPTProcessoRAD.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

       cmp_padrao.ParamValues[0].Asinteger := 0;
       Cmp_Padrao.ParamValues[1].AsBoolean := chkAtraso.Checked;
       Cmp_Padrao.ParamValues[2].AsBoolean := chkEmDia.Checked;
       Cmp_Padrao.ParamValues[3].AsBoolean := chkTerceiros.Checked;
       Cmp_Padrao.ParamValues[4].AsBoolean := chkSubstituto.Checked;
       Cmp_Padrao.ParamValues[5].AsInteger := cbOrdenacao.ItemIndex + 1;

end;
    //Marcus Oliveira 13/11/06 - Para lGravar no RADg.ini após a escolha dos parametro na tela.
procedure TfrmParamRPTProcessoRAD.GravaIni;
begin
  try
    strIni.Values['EMATRASO' + IntToStr( Sistema.IdUsuario )]        := iff( chkAtraso.Checked      , '1', '0' );
    strIni.Values['EMDIA' + IntToStr( Sistema.IdUsuario )]           := iff( chkEmDia.Checked       , '1', '0' );
    strIni.Values['ATRASOTERCEIROS' + IntToStr( Sistema.IdUsuario )] := iff( chkTerceiros.Checked   , '1', '0' );
    strIni.Values['SUBSTITUICAO' + IntToStr( Sistema.IdUsuario )]    := iff( chkSubstituto.Checked  , '1', '0' );
    strIni.SaveToFile( ExtractFilePath(Application.ExeName) + 'RADg.Ini' );
  except
  end;

end;
   //Marcus Oliveira 13/11/06 - Para ler o RADg.ini gravado após a escolha dos parametro na tela.
procedure TfrmParamRPTProcessoRAD.LeIni;
begin
  try
    strIni.LoadFromFile( ExtractFilePath(Application.ExeName) + 'RADg.Ini' );
    chkAtraso.Checked     := StrToIntDef( strIni.Values['EMATRASO' + IntToStr( Sistema.IdUsuario )]        , 1 ) = 1;
    chkEmDia.Checked      := StrToIntDef( strIni.Values['EMDIA' + IntToStr( Sistema.IdUsuario )]           , 1 ) = 1;
    chkTerceiros.Checked  := StrToIntDef( strIni.Values['ATRASOTERCEIROS' + IntToStr( Sistema.IdUsuario )] , 0 ) = 1;
    chkSubstituto.Checked := StrToIntDef( strIni.Values['SUBSTITUICAO' + IntToStr( Sistema.IdUsuario )]    , 0 ) = 1;
  except
    chkAtraso.Checked     := True;
    chkEmDia.Checked      := True;
    chkTerceiros.Checked  := False;
    chkSubstituto.Checked := False;
  end;


end;

procedure TfrmParamRPTProcessoRAD.FormCreate(Sender: TObject);
begin
  inherited;
    strIni := TStringList.Create;
    LeIni;
    frmConsultaRAD := TfrmConsultaRAD.Create(nil);
    cbOrdenacao.ItemIndex := 0;
end;

procedure TfrmParamRPTProcessoRAD.FormDestroy(Sender: TObject);
begin
  inherited;
  GravaIni;
  FreeAndNil( strIni );
end;


end.
