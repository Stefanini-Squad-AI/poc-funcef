unit fParamABC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, wwdblook, StdCtrls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBTables, Wwquery, DBCtrls, TREdit, IvDictio,
  IvMulti, IvEMulti;

type
  TfrmParamABC = class(TfrmOkCancelar)
    Label4: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Grp: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedPercA: TRealEdit;
    dbedPercB: TRealEdit;
    dbedPercC: TRealEdit;
    qryGrpProd: TwwQuery;
    Label5: TLabel;
    dblcGrpProd: TwwDBLookupCombo;
    qryAlmox: TwwQuery;
    qryAux: TwwQuery;
    rgImprimir: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmParamABC : TfrmParamABC;
  sPerc1      : String;
  sPerc2      : String;
  sPerc3      : String;
implementation

uses DRelatoriosAlmox, usistema,uModulo, uMensErro ;

{$R *.DFM}

procedure TfrmParamABC.bbtnConfirmarClick(Sender: TObject);
var rPercAcu : Double;
begin
  sPerc1 := FloatToStr(dbedPercA.Value);
  sPerc2 := FloatToStr(dbedPercB.Value);
  sPerc3 := FloatToStr(dbedPercC.Value);
  If trim(dblcAlmox.Text) = '' Then
    Begin
        MsgDlg('O Almoxarifado não foi preechido','Erro',mtError,[MbOk],0);
        dblcAlmox.SetFocus;
        exit;
    End;
  inherited;
  dtmRelatoriosAlmox.LbAlmox14.Caption := dblcAlmox.Text;
  dtmRelatoriosAlmox.LbGrupo3.Caption  := 'Todos';
  With dtmRelatoriosAlmox.qryABC Do
    Begin
       Close;
       Sql.Clear;
       Sql.Add(' SELECT  ');
       Sql.Add('    ''A'' AS GRUPO,    ');
       Sql.Add('    (0)   AS PERCACU,  ');
       Sql.Add('    P.DESCPROD || '' '' || RTRIM(A.CODCOR, '' '') ||'' ''|| RTRIM(A.CODTAMANHO,'' '') AS PRODUTO,');
       Sql.Add('    S.SALDOQTDE,');
       Sql.Add('    (S.SALDOQTDE*C.CUSTOMEDIO) AS VALORPRODUTO,');
       Sql.Add('    (((S.SALDOQTDE*C.CUSTOMEDIO)/TOT.VALORTOTAL)*100) AS PERC,');
       Sql.Add('    TOT.VALORTOTAL,');
       Sql.Add('    P.CODMEDCUSTO');
       Sql.Add(' FROM');
       Sql.Add('    SALDO S,');
       Sql.Add('    CUSTOMED C,');
       Sql.Add('    PRODUTO P, ');
       Sql.Add('    ALMOX AL,  ');
       Sql.Add('    ARTIGO A,  ');
       Sql.Add('    (SELECT    ');
       Sql.Add('         SUM(S.SALDOQTDE*C.CUSTOMEDIO) AS VALORTOTAL');
       Sql.Add('     FROM                                           ');
       Sql.Add('         SALDO S,                                   ');
       Sql.Add('         CUSTOMED C,                                ');
       Sql.Add('         ALMOX AL,                                  ');
       Sql.Add('         PRODUTO P,                                 ');
       Sql.Add('         ARTIGO A                                   ');
       Sql.Add('     WHERE                                          ');
       Sql.Add('           (S.CODALMOXARIFADO = '+ dblcAlmox.LookupValue + ')');
       Sql.Add('       AND (S.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) + ')');
       If trim(dblcGrpProd.Text) <> '' Then
          Sql.Add('       AND (RTRIM(P.CODGRUPOPROD) LIKE '''+trim(dblcGrpProd.LookupValue)+'%'')');
       Sql.Add('       AND (S.CODALMOXARIFADO = AL.CODALMOXARIFADO) ');
       Sql.Add('       AND (C.CODARTIGO =  S.CODARTIGO )            ');
       Sql.Add('       AND (S.CODARTIGO = A.CODARTIGO)              ');
       Sql.Add('       AND (A.CODPRODUTO = P.CODPRODUTO)            ');
       Sql.Add('       AND (C.CODCUSTEIO = AL.CODCUSTEIO) )   TOT   ');
       Sql.Add(' WHERE                                              ');
       Sql.Add('        (S.CODALMOXARIFADO = '+ dblcAlmox.LookupValue + ')');
       Sql.Add('    AND (S.IDPESSOA = '+ IntToStr(Sistema.IdEmpresa) + ')');
       If trim(dblcGrpProd.Text) <> '' Then
         Begin
           Sql.Add(' AND (RTRIM(P.CODGRUPOPROD) LIKE '''+trim(dblcGrpProd.LookupValue)+'%'')');
           dtmRelatoriosAlmox.LbGrupo3.Caption := dblcGrpProd.Text;
         End;
       Sql.Add('    AND (S.CODARTIGO = C.CODARTIGO)                  ');
       Sql.Add('    AND (S.CODARTIGO = A.CODARTIGO)                  ');
       Sql.Add('    AND (A.CODPRODUTO = P.CODPRODUTO)                ');
       Sql.Add('    AND (S.CODALMOXARIFADO = AL.CODALMOXARIFADO)     ');
       Sql.Add('    AND (C.CODCUSTEIO = AL.CODCUSTEIO)               ');
       Sql.Add(' ORDER BY VALORPRODUTO DESC                         ');
       Open;
       //
       rPercAcu := 0;
       First;
       While not EOF do
          Begin
             rPercAcu := rPercAcu + FieldByName('PERC').AsFloat;
             Edit;
             FieldByName('PERCACU').AsFloat := rPercAcu;
             if rPercAcu <= dbedPercA.Value then begin
                FieldByName('GRUPO').AsString := 'A';
             end else begin
                if (rPercAcu > dbedPercA.Value) and (rPercAcu <= dbedPercB.Value) then begin
                   FieldByName('GRUPO').AsString := 'B';
                end else begin
                   if (rPercAcu > dbedPercB.Value) and (rPercAcu <= dbedPercC.Value) then begin
                      FieldByName('GRUPO').AsString := 'C';
                   end else begin
                      FieldByName('GRUPO').AsString := 'D';
                   end;
                end;
             end;
             Post;
             Next;
          end;
       //
       if rgImprimir.ItemIndex <> 0 then
          Begin
             First;
             While not EOF do
                Begin
                   if (rgImprimir.ItemIndex = 1) and (FieldByName('GRUPO').AsString <> 'A') then begin
                      Delete;
                   end else begin
                      if (rgImprimir.ItemIndex = 2) and (FieldByName('GRUPO').AsString <> 'A') and (FieldByName('GRUPO').AsString <> 'B') then begin
                         Delete;
                      end else begin
                         if (rgImprimir.ItemIndex = 3) and (FieldByName('GRUPO').AsString = 'D') then begin
                            Delete;
                         end else begin
                            Next;
                         end;
                      end;
                   end;
                end;
          end;
       First;
   End;

end;

procedure TfrmParamABC.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlmox.Close;
  qryAlmox.Params[0].Value := Sistema.idEmpresa;
  qryAlmox.Open;
  //
  qryGrpProd.Open;
end;

end.
