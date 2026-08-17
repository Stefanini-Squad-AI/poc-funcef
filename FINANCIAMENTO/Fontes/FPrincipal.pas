unit FPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  fTelaAut, uAutorizacao, uSistema, TB97, Db, Wwdatsrc, DBTables, Wwquery,
  wwdblook, StdCtrls, Mask, wwdbedit, DBCtrls, uModulo, TB97Tlwn, TB97Tlbr,
  TB97Ctls, CorreioCM, IvDictio, IvAMulti, IvBinDic, IvMulti, IvEMulti,
  fcLabel, AppEvnts, CMApplicationEvents, StdActns, ActnList, ImgList,
  fcStatusBar;

type
  TfrmPrincipal = class(TfrmCMPrincipal)
    Proposta1: TMenuItem;
    N3: TMenuItem;
    AnlisedeProposta1: TMenuItem;
    N4: TMenuItem;
    GeraodeContratodeVenda1: TMenuItem;
    GeraodasParcelasdoContratodeVenda1: TMenuItem;
    procedure Proposta1Click(Sender: TObject);
    procedure AnlisedeProposta1Click(Sender: TObject);
    procedure GeraodeContratodeVenda1Click(Sender: TObject);
    procedure GeraodasParcelasdoContratodeVenda1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
{$R *.DFM}

uses
     FCadPropFinanc, fAnalProp, FGeraContrato, FGeraParcelaCont;


procedure TfrmPrincipal.Proposta1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmCadPropFinanc,TFrmCadPropFinanc,False);
end;

procedure TfrmPrincipal.AnlisedeProposta1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAnalProp,TfrmAnalProp,False);
end;

procedure TfrmPrincipal.GeraodeContratodeVenda1Click(Sender: TObject);
begin
  inherited;
  AbrirForm(FrmGeraContrato,TFrmGeraContrato,False);
end;

procedure TfrmPrincipal.GeraodasParcelasdoContratodeVenda1Click(
  Sender: TObject);
begin
  inherited;
  AbrirForm(FrmGeraParcelaCont,TFrmGeraParcelaCont,False);
end;

initialization

   Sistema.NomeModulo := 'Financiamento';    // Nome do Módulo
   Sistema.IdModulo := 135 ;                // IdModulo cadastrado no SAD
   Sistema.Versao := '3.00.00';
   Sistema.NomeAplicativo := 'Financiamento';

   Modulo := TModulo.Create  ;

finalization
   Modulo.free;


end.
