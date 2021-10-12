# frozen_string_literal: true

require './lib/caesar'

# rubocop:disable Metrics/BlockLength

describe CaesarCipher do
  describe '#caesar_cipher' do
    let(:cipher) { subject.caesar_cipher(text, key) }

    context 'when the key is of different ranges' do
      let(:text) { 'hello world' }

      context 'when the key is small positive' do
        let(:key) { 3 }

        it "returns 'khoor zruog'" do
          expect(cipher).to eq('khoor zruog')
        end
      end

      context 'when the key is large positive' do
        let(:key) { 3433 }

        it "returns 'ifmmp xpsme'" do
          expect(cipher).to eq('ifmmp xpsme')
        end
      end

      context 'when the key is 0' do
        let(:key) { 0 }

        it "returns 'hello world'" do
          expect(cipher).to eq('hello world')
        end
      end

      context 'when the key is small negative' do
        let(:key) { -4 }

        it "returns 'dahhk sknhz'" do
          expect(cipher).to eq('dahhk sknhz')
        end
      end

      context 'when the key is large negative' do
        let(:key) { -5683 } 

        it "returns 'spwwz hzcwo'" do
          expect(cipher).to eq('spwwz hzcwo')
        end
      end
    end

    context 'when the text is lower-case' do
      let(:text) { 'hello world' }

      context 'when the key is positive' do
        let(:key) { 5 }

        it "returns 'mjqqt btwqi'" do
          expect(cipher).to eq('mjqqt btwqi')
        end
      end

      context 'when the key is negative' do
        let(:key) { -5 }

        it "returns 'czggj rjmgy'" do
          expect(cipher).to eq('czggj rjmgy')
        end
      end
    end

    context 'when the text is upper-case' do
      let(:text) { 'HELLO WORLD' }

      context 'when the key is positive' do
        let(:key) { 5 }

        it "returns 'MJQQT BTWQI'" do
          expect(cipher).to eq('MJQQT BTWQI')
        end
      end

      context 'when the key is negative' do
        let(:key) { -5 }

        it "returns 'CZGGJ RJMGY'" do
          expect(cipher).to eq('CZGGJ RJMGY')
        end
      end
    end

    context 'when the text is mixed-case' do
      let(:text) { 'Hello WoRLd' }

      context 'when the key is positive' do
        let(:key) { 5 }

        it "returns 'Mjqqt BtWQi'" do
          expect(cipher).to eq('Mjqqt BtWQi')
        end
      end

      context 'when the key is negative' do
        let(:key) { -5 }

        it "returns 'Czggj RjMGy'" do
          expect(cipher).to eq('Czggj RjMGy')
        end
      end
    end

    context 'when the text is with numbers' do
      context 'when the text is mixed with numbers' do
        let(:text) { 'H3110 W0R16' }

        context 'when the key is positive' do
          let(:key) { 5 }

          it "returns 'M3110 B0W16'" do
            expect(cipher).to eq('M3110 B0W16')
          end
        end

        context 'when the key is negative' do
          let(:key) { -5 }

          it "returns 'C3110 R0M16'" do
            expect(cipher).to eq('C3110 R0M16')
          end
        end
      end

      context 'when the text is full of numbers' do
        let(:text) { '111343111' }

        context 'when the key is positive' do
          let(:key) { 5 }

          it "returns '111343111'" do
            expect(cipher).to eq('111343111')
          end
        end

        context 'when the key is negative' do
          let(:key) { -5 }

          it "returns '111343111'" do
            expect(cipher).to eq('111343111')
          end
        end
      end
    end

    context 'when the text is with special characters' do
      context 'when the text is mixed with special characters' do
        let(:text) { 'H))$$ W!R))' }

        context 'when the key is positive' do
          let(:key) { 5 }

          it "returns 'M))$$ B!W))'" do
            expect(cipher).to eq('M))$$ B!W))')
          end
        end

        context 'when the key is negative' do
          let(:key) { -5 }

          it "returns 'C))$$ R!M))'" do
            expect(cipher).to eq('C))$$ R!M))')
          end
        end
      end

      context 'when the text is full of special characters' do
        let(:text) { '(){}$-.* ^%@' }

        context 'when the key is positive' do
          let(:key) { 5 }

          it "returns '(){}$-.* ^%@'" do
            expect(cipher).to eq('(){}$-.* ^%@')
          end
        end

        context 'when the key is negative' do
          let(:key) { -5 }

          it "returns '(){}$-.* ^%@'" do
            expect(cipher).to eq('(){}$-.* ^%@')
          end
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
