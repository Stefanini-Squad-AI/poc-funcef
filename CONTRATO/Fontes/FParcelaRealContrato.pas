unit FParcelaRealContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, wwdbedit, wwdblook, Mask, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmParcelaRealContrato = class(TfrmCadastroCS)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBLComboContrato: TwwDBLookupCombo;
    DBLComboObjeto: TwwDBLookupCombo;
    DBLComboItem: TwwDBLookupCombo;
    DBDataVencimentoParcela: TCMDateTimePicker;
    DBQtdeParcela: TwwDBEdit;
    DBValorObjetoParcela: TwwDBEdit;
    DBDataRealParcela: TCMDateTimePicker;
    DBNumNotaFiscal: TwwDBEdit;
    qryContrato: TwwQuery;
    qryObjeto: TwwQuery;
    qryItem: TwwQuery;
    qryObjetoItemContratual: TwwQuery;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    qryMedicao: TwwQuery;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParcelaRealContrato: TfrmParcelaRealContrato;

implementation
uses uDataBase,uSistema,uIntegraBack;
{$R *.DFM}


procedure TfrmParcelaRealContrato.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   if ds.State in [dsinsert]then begin
   qry.FieldByName('IDPARCELA').AsInteger := LeUltRegistro(nil, 'PARCELAREALCONTRATO');
   qry.FieldByName('IDPESSOA').AsInteger := Sistema.idempresa;
   qry.FieldByName('PLNCODIGO').AsInteger := IntegraBack.Plano;

   end;
end;
procedure TfrmParcelaRealContrato.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
      qry.close;
      qry.ParamByname('IDCONTRATO').Asinteger := StrToInt(Trim(MontaSelect.ValoresChave[0]));
      qry.Open;
   end;
end;
procedure TfrmParcelaRealContrato.FormActivate(Sender: TObject);
begin
   inherited;
   qry.Close;
   qry.ParamByname('IDCONTRATO').Asinteger := 0;
   qry.Open;

   qryContrato.Close;
   qryContrato.Open;

   qryObjeto.Close;
   qryObjeto.Open;

   qryItem.Close;
   qryItem.Open;
end;

end.

