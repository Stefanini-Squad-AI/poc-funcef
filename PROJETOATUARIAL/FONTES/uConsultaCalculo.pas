unit uConsultaCalculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, StdCtrls, checklst, DBCtrls, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Wwquery, Grids, DBGrids;

type
  TfrmConsultaCalculo = class(TfrmOkCancelar)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ChckLstBxVariavel: TCheckListBox;
    wwqryCalculo: TwwQuery;
    wwqryVariavel: TwwQuery;
    DtSrcVariavel: TDataSource;
    DtSrcCalculos: TDataSource;
    wwqryCalculoCD_PESSOA_ENTID: TFloatField;
    wwqryCalculoCD_PESSOA_PATROC: TFloatField;
    wwqryCalculoCD_PLANO: TFloatField;
    wwqryCalculoDT_GERACAO: TDateTimeField;
    wwqryCalculoDS_HIPOTESE: TStringField;
    DBGrid: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaCalculo: TfrmConsultaCalculo;

implementation
uses uglobal, uVersaoBase, FTelaAut, uCubo, uFuncGerais;

{$R *.DFM}

procedure TfrmConsultaCalculo.FormCreate(Sender: TObject);
begin

  if uGlobal.WG_CD_VERSAO = 0 then
   begin
     ShowMessage('Selecione primerio uma Versão da Base !');
     AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
     close;
     exit;
   end;

  If WG_CD_PESSOA_ENTID <> 0 Then
        Begin
          wwqryCalculo.ParamByName('CD_PESSOA_ENTID').AsInteger := WG_CD_PESSOA_ENTID;
          wwqryCalculo.ParamByName('CD_PESSOA_PATROC').AsInteger := WG_CD_PESSOA_PATROC;
          wwqryCalculo.ParamByName('CD_PLANO').AsInteger := WG_CD_PLANO;
          wwqryCalculo.Open;
        End;

  wwqryVariavel.Open;
end;

procedure TfrmConsultaCalculo.bbtnConfirmarClick(Sender: TObject);

Var WData     : String;
    WInd      : Integer;
    WVariavel : String;
begin

     Screen.Cursor := crHourGlass;
     Application.CreateForm(TfrmCubo, frmCubo);

     // Formata Data
     WData := FormatDateTime('dd/mm/yyyy',wwqryCalculo.FieldByName('DT_GERACAO').AsDateTime);
     WData := Formata_Data(WData,'DD/MM/AAAA');
     WData := WData + ' ' + FormatDateTime('hh:nn:ss',wwqryCalculo.FieldByName('DT_GERACAO').AsDateTime);

     // Formata variáveis
     WVariavel := '';
     WInd := 0;
     While WInd < ChckLstBxVariavel.Items.Count Do
       Begin
         If Wvariavel = '' Then
            Begin
              If ChckLstBxVariavel.Checked[WInd] Then
                 WVariavel := #39 + ChckLstBxVariavel.Items.Strings[WInd] + #39
            End
         Else
            Begin
              If ChckLstBxVariavel.Checked[WInd] Then
                 WVariavel := WVariavel + ',' + #39 + ChckLstBxVariavel.Items.Strings[WInd] + #39;
            End;
         WInd := WInd + 1;
       End;


     frmCubo.DecisionQuery1.SQL.Clear;
     frmCubo.DecisionQuery1.SQL.Add ('SELECT TB.SG_TIPO_BENEF, TG.NO_GRUPO_PARTIC, OC.NO_VARIAVEL, SUM( OC.VL_CALCULO_ATUARIAL )');
     frmCubo.DecisionQuery1.SQL.Add ('FROM FI_OCOR_CALCULO_ATUARIAL OC,');
     frmCubo.DecisionQuery1.SQL.Add ('     FI_REFER_CALCULO_ATUARIAL RC,');
     frmCubo.DecisionQuery1.SQL.Add ('     FI_GRUPO_PARTICIPANTE TG,');
     frmCubo.DecisionQuery1.SQL.Add ('     FI_TIPO_BENEFICIO TB');
     frmCubo.DecisionQuery1.SQL.Add ('WHERE OC.CD_PESSOA_ENTID = ' + inttostr(WG_CD_PESSOA_ENTID));
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_PESSOA_PATROC = ' + inttostr(WG_CD_PESSOA_PATROC));
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_PLANO = ' + inttostr(WG_CD_PLANO));
     frmCubo.DecisionQuery1.SQL.Add ('  AND to_char(OC.DT_GERACAO, '+ #39 + 'dd/mm/yyyy hh24:mi:ss'
                                     +#39+ ') = '+ #39 + WData + #39);
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_VERSAO = RC.CD_VERSAO ');
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_PESSOA_ENTID = RC.CD_PESSOA_ENTID ');
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_PESSOA_PATROC = RC.CD_PESSOA_PATROC ');
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_PLANO = RC.CD_PLANO ');
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.DT_GERACAO = RC.DT_GERACAO ');
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_GRUPO_PARTIC = TG.CD_GRUPO_PARTIC ');
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_GRUPO_PARTIC = TG.CD_GRUPO_PARTIC ');
     frmCubo.DecisionQuery1.SQL.Add ('  AND OC.CD_TIPO_BENEF = TB.CD_TIPO_BENEF  ');
     If Wvariavel <> '' Then
        frmCubo.DecisionQuery1.SQL.Add ('  AND OC.NO_VARIAVEL IN (' + WVariavel + ')');
     frmCubo.DecisionQuery1.SQL.Add ('GROUP BY TB.SG_TIPO_BENEF, TG.NO_GRUPO_PARTIC, OC.NO_VARIAVEL');

     frmCubo.DecisionQuery1.Open;
     Screen.Cursor := crDefault;
     frmCubo.ShowModal;

end;



procedure TfrmConsultaCalculo.DBGridCellClick(Column: TColumn);
var
  wind : integer;
Begin
     ChckLstBxVariavel.Clear;
     WInd := 0;
     wwqryVariavel.first;

     While NOT wwqryVariavel.Eof Do
       Begin
         ChckLstBxVariavel.Items.Add(wwqryVariavel.FieldByName('NO_VARIAVEL').AsString);
         ChckLstBxVariavel.Checked[WInd] := True;
         WInd := WInd + 1;
         wwqryVariavel.Next;
       End;
end;

procedure TfrmConsultaCalculo.DBGridColEnter(Sender: TObject);
var
  wind : integer;
Begin
     ChckLstBxVariavel.Clear;
     WInd := 0;
     wwqryVariavel.first;

     While NOT wwqryVariavel.Eof Do
       Begin
         ChckLstBxVariavel.Items.Add(wwqryVariavel.FieldByName('NO_VARIAVEL').AsString);
         ChckLstBxVariavel.Checked[WInd] := True;
         WInd := WInd + 1;
         wwqryVariavel.Next;
       End;
end;

end.
