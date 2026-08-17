unit FParamGerCartSintetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, 
  UOperacaoInvest, UOperComum, dOperComum, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TFrmParamGerCartSintetico = class(TfrmOkCancelar)
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    Label4: TLabel;
    dblcCarteira: TwwDBLookupCombo;
    qryCarteira: TwwQuery;
    RdgCustos: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamGerCartSintetico: TFrmParamGerCartSintetico;

implementation

{$R *.DFM}

uses uSistema, uMensErro, UBibliotecaInvest, FDmRelatorios;

Procedure TfrmParamGerCartSintetico.FazQry;
var
   fNulo, fSaldoMercado, fSaldoCar, fTSaldoVlrMerc, fTSaldoCar, fTSaldoAtu,
   fTSaldoAqui,
   fCotacao, wTotalCarteira, wCotaMoeda, fSaldoAtu, fSaldoAqui : double;
   iCartant, iMoeda, iEmpresas, iEmissor : integer;
   QryLocal :TwwQuery;
   dDataCotacao: TDateTime;
Begin
    QryLocal              := TwwQuery.Create(Application);
    QryLocal.DatabaseName := 'BaseDados';

// Busca Moeda Atuarial
  FazQuery(QryLocal, 'SELECT * FROM PARAMINVEST');
  iMoeda := QryLocal.FieldByName('MOEDAATU').AsInteger;
  if iMoeda <> 0 then
    OperComum.BuscaCotacaoMoeda(iMoeda, edDataRef.Date, '', wCotaMoeda, dDataCotacao)
  else
    wCotaMoeda := 0;

    fNulo    := 0;
    iCartAnt := 0;
    With DmRelatorios.qryGerCartSintetico Do
      Begin
          DmRelatorios.RptGerCartSinteticoLabel2.Caption    := edDataRef.Text;
          Close;
          Sql.Clear;
          Sql.add(' SELECT                                                                    ');
          Sql.add('     CA.DESCCARTINVEST, SE.DESCSETOREMISSOR, (0) AS SALDOAQUI,              ');
          Sql.add('     H1.IDCARTEIRAINVEST, EM.IDSETOREMISSOR, (0) AS SALDOATU,           ');
          Sql.add('     (0) AS EMPRESAS, (0) AS VALORMERCADO, (0) AS SALDOCAR, (0) AS TOTCART  ');
          Sql.add('  FROM                                                                  ');
          Sql.add('     HISTCARTINV H1, CARTEIRAINVEST CA, INVESTIMENTO IV,       ');
          Sql.add('     EMISSOR EM, SETOREMISSOR SE                                  ');
          Sql.add('  WHERE                                                                 ');
          Sql.add('        (H1.IDCARTEIRAINVEST     = CA.IDCARTEIRAINVEST)     ');
          Sql.add('    AND (H1.IDINVESTIMENTO       = IV.IDINVESTIMENTO)       ');
          Sql.add('    AND (H1.IDINVESTIMENTO  IS NOT NULL)                    ');
          Sql.add('    AND (IV.IDEMISSOR            = EM.IDEMISSOR)            ');
          Sql.add('    AND (EM.IDSETOREMISSOR       = SE.CODSETOREMISSOR)      ');
          Sql.add('    AND (H1.SALDOQTDEINVCART     <> 0 )      ');

            if Trim(dblcCarteira.Text) <> '' Then
               Sql.add('    AND (H1.IDCARTEIRAINVEST = '+dblcCarteira.LookupValue+')  ');

          Sql.add('  GROUP BY CA.DESCCARTINVEST, SE.DESCSETOREMISSOR,                 ');
          Sql.add('           H1.IDCARTEIRAINVEST, EM.IDSETOREMISSOR                  ');

          Open;
          First;

          While Not EOF Do Begin
            if iCartant <> FieldByName('IDCARTEIRAINVEST').AsInteger then begin
               OperComum.SaldosInvCart(FieldByName('IDCARTEIRAINVEST').AsInteger,
                                   edDataRef.Date, fNulo, fNulo,
                                   fNulo, fNulo, fNulo, fNulo, wTotalCarteira);
               iCartAnt := FieldByName('IDCARTEIRAINVEST').AsInteger;
            end;
//          Busca Investimentos da Carteira que pertencem ao Setor selecionado
            FazQuery(QryLocal,'SELECT DISTINCT '+
                '   HC.IDCARTEIRAINVEST, HC.IDINVESTIMENTO, EM.IDEMISSOR '+
                'FROM HISTCARTINV HC, INVESTIMENTO IV , EMISSOR EM '+
                'WHERE 	(HC.IDCARTEIRAINVEST = '''+ FieldByName('IDCARTEIRAINVEST').AsString+''') AND '+
                '      	(HC.IDINVESTIMENTO = IV.IDINVESTIMENTO) AND '+
                '       (HC.IDINVESTIMENTO  IS NOT NULL) AND '+
                '       (IV.IDEMISSOR      = EM.IDEMISSOR) AND  '+
                '       (EM.IDSETOREMISSOR = '''+ FieldByName('IDSETOREMISSOR').AsString+''') '+
                'ORDER BY HC.IDCARTEIRAINVEST, EM.IDEMISSOR, HC.IDINVESTIMENTO ');

            fTSaldoVlrMerc := 0;
            FTSaldoCar     := 0;
            fTSaldoAtu     := 0;
            fTSaldoAqui    := 0;
            iEmpresas      := 0;
            iEmissor       := 0;
            While Not QryLocal.Eof Do Begin
              // Busca Saldos do Investimento
              OperComum.CalculaSaldo(QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                                            QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger, '-1',
                                            edDataRef.Date,
                                            fNulo, fNulo, fNulo, fNulo, fSaldoAtu, fSaldoCar,
                                            fSaldoAqui, fNulo, fSaldoMercado, fNulo, fNulo, fNulo,
                                            fNulo, fNulo, fNulo, fNulo, fNulo);
              fTSaldoVlrMerc := fTSaldoVlrMerc + fSaldoMercado;
              fTSaldoCar     := fTSaldoCar     + fSaldoCar * wCotaMoeda;
              fTSaldoAtu     := fTSaldoAtu     + fSaldoAtu * wCotaMoeda;
              fTSaldoAqui    := fTSaldoAqui    + fSaldoAqui;
              // Capta a quantidade de empresas no setor sem saldo no sistema
              if fSaldoMercado <> 0 then
              begin
                 if iEmissor <> QryLocal.FieldByName('IDEMISSOR').AsInteger then
                 begin
                    iEmissor := QryLocal.FieldByName('IDEMISSOR').AsInteger;
                    iEmpresas := iEmpresas + 1;
                 end;
              end;
              QryLocal.Next;
              End;
            Edit;

            FieldByName('VALORMERCADO').asFloat := fTSaldoVlrMerc;
            FieldByName('TOTCART').asFloat      := wTotalCarteira;
            FieldByName('EMPRESAS').asFloat     := iEmpresas;

            if RdgCustos.ItemIndex = 0 then
            begin
               FieldByName('SALDOCAR').asFloat      := fTSaldoCar;
               DmRelatorios.LblCustos.Caption       := 'Custo Carregamento';
               DmRelatorios.LblCarregamento.Visible := True;
               DmRelatorios.LblAquisicao.Visible    := False;
               DmRelatorios.LblAtuarial.Visible     := False;
               DmRelatorios.TotSaldoCar.Visible     := True;
               DmRelatorios.TotSaldoAtu.Visible     := False;
               DmRelatorios.TotSaldoAqui.Visible    := False;
            end
            else if RdgCustos.ItemIndex = 1 then
            begin
               FieldByName('SALDOATU').asFloat      := fTSaldoAtu;
               DmRelatorios.LblCustos.Caption       := 'Custo Atuarial';
               DmRelatorios.LblCarregamento.Visible := False;
               DmRelatorios.LblAquisicao.Visible    := False;
               DmRelatorios.LblAtuarial.Visible     := True;
               DmRelatorios.TotSaldoCar.Visible     := False;
               DmRelatorios.TotSaldoAtu.Visible     := True;
               DmRelatorios.TotSaldoAqui.Visible    := False;
            end
            else
            begin
               FieldByName('SALDOAQUI').asFloat     := fTSaldoAqui;
               DmRelatorios.LblCustos.Caption       := 'Custo Aquisição';
               DmRelatorios.LblCarregamento.Visible := False;
               DmRelatorios.LblAquisicao.Visible    := True;
               DmRelatorios.LblAtuarial.Visible     := False;
               DmRelatorios.TotSaldoCar.Visible     := False;
               DmRelatorios.TotSaldoAtu.Visible     := False;
               DmRelatorios.TotSaldoAqui.Visible    := True;
            end;

            Post;
            Next;
          End;
          First;
      End;
    QryLocal.Free;
End;


procedure TFrmParamGerCartSintetico.FormCreate(Sender: TObject);
begin
  inherited;

  edDataRef.Date := Date;
end;

procedure TFrmParamGerCartSintetico.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamGerCartSintetico.edDataRefExit(Sender: TObject);
begin
  inherited;
  If trim(edDataRef.Text) = '' Then
     Begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     End;
end;

procedure TFrmParamGerCartSintetico.FormShow(Sender: TObject);
begin
  inherited;
  qryCarteira.open;
end;

procedure TFrmParamGerCartSintetico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryCarteira.Close;
end;

end.
